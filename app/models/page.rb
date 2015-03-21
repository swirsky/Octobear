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
    self.text.scan(/.{#{self.line_length}}|.+/)
  end

  private

  def kill_ciphers
    RunningCipher.where(book_id:self.book_id, page_number:self.page_number).each(&:destroy)
  end
end
