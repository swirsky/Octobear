class RunningKey < ActiveRecord::Base
  include CryptoHelper

  belongs_to :user
  belongs_to :book

  before_save :sanitize_input, :set_indicator_block, :set_and_sanitize_key, :encrypt_message

  def indicator_block_position
    2
  end

  private

  def set_indicator_block
    arr = []
    self.indicator_block = ""
    arr << self.page / 100
    arr << (self.page % 100) / 10 
    arr << self.page % 10
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
    puts self.key.inspect
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
    self.key = self.book.open_book(self.page, self.line).gsub(/[^a-zA-Z]/, "").upcase
  end

end
