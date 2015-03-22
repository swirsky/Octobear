class Page < ActiveRecord::Base
  
  validates_presence_of :text, :page_number, :book_id

  belongs_to :book

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
      if chars[0..self.line_length].match(/\n/)
        t = chars[0..chars.index(/\n/)]
        @done = true
      elsif chars.length > self.line_length
        t = chars[0..self.line_length]
        @done = false
        ex = ''
        chars[(self.line_length+1)..(self.line_length+5)].chars.each do |c|
          next if @done
          if c.match(/[a-zA-Z\.\,\!\?\n\r]/)
            ex += c
            @done = true if c.match(/[\.\,\!\?\n\r]/)
          else
            @done = true
          end
        end
        chars[self.line_length+ex.length..self.line_length+1+ex.length].chars.each_with_index do |cap, i|
         next if @done
         if cap.match(/[\n\r\s\,\.\!\?]/)
           case i
           when 0
             ex += cap
           when 1
             ex += chars[self.line_length+ex.length..self.line_length+1+ex.length]
           end
            @done = true
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
    self.text.gsub!("  ", " ")
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
