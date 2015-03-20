class RotCypher < ActiveRecord::Base
  include CryptoHelper

  before_save :encrypt_message

  LINE_LENGTH = 25

  def blockify_input
    input_groups = set_input_groups
    blocker = ""
    input_groups.each do |g|
      blocker << "#{g}\n"
    end
    blockify(blocker)
  end

  def blockify_output
    blockify(self.output)
  end

  private

  def encrypt_message
    sanitize_input!
    groups = set_input_groups
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

  def set_input_groups
   groups = []
   ((self.input.length/LINE_LENGTH)+1).times do |i|
     groups << self.input[(i*LINE_LENGTH)..((i*LINE_LENGTH)+LINE_LENGTH-1)]
   end
   groups
  end
end
