class RotCypher < ActiveRecord::Base
  include CryptoHelper

  before_save :encrypt_message

  LINE_LENGTH = 25

  def get_line_length
    LINE_LENGTH
  end

  private

  def encrypt_message
    sanitize_input!
    groups = set_input_groups(LINE_LENGTH)
    self.output = ""
    groups.each do |g|
      self.output += "#{encrypt_line(g)}\n"
    end
  end

  def encrypt_line(line)
    result = ""
    line.chars.each do |c|
      if ALPHA_TO_NUM[c]
        lookup_num = (ALPHA_TO_NUM[c] + self.rot)%26
        result += ALPHA_LOOKUP[lookup_num]
      else
        result += c
      end
    end
    result
  end

  def sanitize_input!
    self.input.upcase!
  end
end
