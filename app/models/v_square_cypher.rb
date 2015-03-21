class VSquareCypher < ActiveRecord::Base
  include CryptoHelper

  belongs_to :user

  before_save :encrypt_message

  LINE_LENGTH = 25
 
  def line_length
    LINE_LENGTH
  end

  private

  def encrypt_message
    sanitize_input
    groups = set_input_groups(LINE_LENGTH)
    self.output = ""
    groups.each do |g|
      self.output << "#{encrypt_line(g)}\n"
    end
  end

  def sanitize_input
    self.input.gsub!(/[^a-zA-Z\s]/, "")
    self.input.upcase!
    self.codeword.gsub!(/[^a-zA-Z]/, "")
    self.codeword.upcase!
  end

  def encrypt_line(line)
    code_count = 0
    result = ""
    line.chars.each do |c|
      if c.blank?
        result += " "
      else
        code_count = 0 unless code_count < self.codeword.length
        result += ALPHA_SQUARE[self.codeword[code_count]][ALPHA_TO_NUM[c]]
        code_count +=1
      end
    end
    result
  end
end
