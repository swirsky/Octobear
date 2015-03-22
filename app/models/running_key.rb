class RunningKey < ActiveRecord::Base
  include CryptoHelper

  belongs_to :user
  belongs_to :book
  belongs_to :page

  validates_presence_of :input, :page_number, :line, :group_length, :user_id, :book_id
  validate :valid_line?

  before_save :sanitize_input, :set_page, :set_indicator_block, :set_and_sanitize_key, :encrypt_message

  def indicator_block_position
    2
  end

  private

  def valid_line?
    errors.add(:line, "Line not available on page") unless self.book.open_book(self.page_number, self.line)
  end

  def set_indicator_block
    arr = []
    self.indicator_block = ""
    if self.group_length > 5
      #add random letters to start of indicator block
      (self.group_length - 5).times do |i|
        self.indicator_block += ALPHA_LOOKUP[rand(1000)%26]
      end
    end
    arr << self.page_number / 100
    arr << (self.page_number % 100) / 10 
    arr << self.page_number % 10
    arr << self.line / 10
    arr << self.line % 10
    arr.each do |c|
      self.indicator_block += ALPHA_LOOKUP[c]
    end
  end

  def encrypt_message
    self.output = ""
    blocks = []
    str = ""
    self.input.chars.each_with_index do |c, index|
      if index%self.group_length == 0
        blocks << str
        str = ""
      end
      str += ALPHA_SQUARE[self.key[index]][ALPHA_TO_NUM[c]]
    end
    blocks << str unless str.blank?
    blocks.insert((blocks.count-self.indicator_block_position), self.indicator_block)
    self.output = blocks.join(" ")
  end

  def sanitize_input
    self.input.gsub!(/[^a-zA-Z]/, "")
    self.input.upcase!
  end

  def set_and_sanitize_key
    self.key = ""
    self.input.scan(/.{#{self.page.line_length}}|.+/).each_index do |i|
     self.key += self.book.open_book(self.page_number, self.line+i).gsub(/[^a-zA-Z]/, "").upcase
    end
  end

  def set_page
    self.page_id = Page.where(page_number:self.page_number,book_id:self.book_id).first.id
  end

end
