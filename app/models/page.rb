class Page < ActiveRecord::Base
  
  validates_presence_of :text, :page_number, :book_id

  belongs_to :book

  after_destroy :kill_ciphers

  def blockify_text
    lines.join("<br>").gsub('\n', '<br>')
  end

  def get_line(line)
    lines[line]
  end

  def lines
    #get first 50, then keep grabbing until space
    #self.text.scan(/.{#{self.line_length}}|.+[(a-zA-Z)\.\,\!]{1,5}/).each(&:strip!)
    chars = self.text
    lines = []
    while !chars.empty?
      if chars[0..50].match(/\n/)
        t = chars[0..chars.index(/\n/)]
      elsif chars.length >= 50
        t = chars[0..50]
        done = false
        ex = ''
        puts 'checking more'
        chars[51..55].chars.each do |c|
          next if done
          puts 'loop'
          if c.match(/[a-zA-Z\.\,\!\?]/)
            ex += c
            done = true if c.match(/[\.\,\!\?]/)
          else
            done = true
          end
        end
        t += ex if done
        puts t.inspect
      else
        t = chars
      end
    lines << t
    chars.sub!(t, '')
    end
    lines
  end

  private

  def kill_ciphers
    RunningCipher.where(book_id:self.book_id, page_number:self.page_number).each(&:destroy)
  end
end
