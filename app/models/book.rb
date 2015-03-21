class Book < ActiveRecord::Base
  has_many :running_keys
  has_many :pages

  def open_book(page, line)
    p = self.pages.where(page_number:page).first
    p.get_line(line)
  end
end
