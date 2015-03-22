class Page < ActiveRecord::Base
  
  validates_presence_of :text, :page_number, :book_id

  belongs_to :book

  after_destroy :kill_ciphers

  def blockify_text
    lines.join("<br>")
  end

  def get_line(line)
    lines[line]
  end

  def lines
    #get first 50, then keep grabbing until space
    self.text.scan(/.{#{self.line_length}}|.+[(a-zA-Z)\.\,\!]{1,5}/).each(&:strip!)
  end

  private

  def kill_ciphers
    RunningCipher.where(book_id:self.book_id, page_number:self.page_number).each(&:destroy)
  end
end
