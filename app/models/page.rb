class Page < ActiveRecord::Base
  belongs_to :book

  def blockify_text
    lines.join("<br>")
  end

  def get_line(line)
    lines[line]
  end

  def lines
    self.text.scan(/.{#{self.line_length}}|.+/)
  end
end
