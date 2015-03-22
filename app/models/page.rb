class Page < ActiveRecord::Base
  
  validates_presence_of :text, :page_number, :book_id

  belongs_to :book
  has_many :running_ciphers

  after_destroy :kill_ciphers
  before_save :sanitize_text
  before_save :check_ciphers

  def page_width
    lines.collect{|line| line.gsub(' ','').length}.sort {|a,b| b <=> a}.first*0.75
  end

  def blockify_text
    lines.join("<br>").gsub('\n', '<br>')
  end

  def get_line(line)
    lines[line-1]
  end

  def lines
    #get first 50, then keep grabbing until space
    #self.text.scan(/.{#{self.line_length}}|.+[(a-zA-Z)\.\,\!]{1,5}/).each(&:strip!)
    chars = self.text
    lines = []
    while !chars.empty?
      if chars[0..(self.line_length-5)].match(/\n/)
        t = chars[0..chars.index(/\n/)]
        @done = true
      elsif chars.length > (self.line_length-5)
        t = chars[0..(self.line_length-5)]
        @done = false
        ex = ''
        chars[(self.line_length-4)..(self.line_length+1)].chars.each do |c|
          next if @done
          if c.match(/[a-zA-Z0-9\.\,\!\?\n\r]/)
            ex += c
            @done = true if c.match(/[\.\,\!\?\n\r]/)
          else
            @done = true
          end
        end

        tail_str = ""
        tail_done = false
        chars[(self.line_length+2)..(self.line_length+5)].chars.each_with_index do |c, i|
          next if @done || tail_done
          if c.match(/[a-zA-Z0-9]/)
            tail_str += c
          else
            tail_str = ""
            tail_done = true
          end
        end

        ex += tail_str

        #check for final punctuation
        first_cap = ""
        chars[(t.length+ex.length)..(t.length+1+ex.length)].chars.each_with_index do |cap, i|
          next if @done
          if cap.match(/[\n\r\s\,\.\!\?]/)
            puts "matched!"
            ex += first_cap + cap
            @done = true
          elsif cap.match(/[a-zA-Z0-9]/)
            first_cap = cap
          end
        end
        t += ex if @done
      else
        @done = true
        t = chars
      end
      adder = @done ? t : "#{t}-"
      lines << adder
      chars = chars.sub(t, '')
    end
    lines
  end

  private

  def sanitize_text
    self.text.gsub("  ", " ")
  end

  def check_ciphers
    RunningKey.where(book_id:self.book_id, page:self.page_number).each do |rk|
      rk.destroy if lines[rk.line].nil?
    end
  end

  def kill_ciphers
    RunningKey.where(book_id:self.book_id, page:self.page_number).each(&:destroy)
  end
end
