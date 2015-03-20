class TranspositionCipher < ActiveRecord::Base
  include CryptoHelper

  belongs_to :user

  before_save :encrypt_message

  def line_length
    self.keyword.length
  end

  def blockify_input(params={})
    if params[:string]
      super(self.set_input_groups(self.line_length))
    else
    formatted_blockify(self.set_input_groups(self.line_length))
    end
  end

  def blockify_output(params={})
    if params[:string]
      super
    else
      transposed = self.transpose_groups
      code = ""
      transposed.each do |t|
        code += t.strip
      end
      formatted_blockify(code.scan(/.{#{self.output_line_length}}|.+/))
    end
  end

  def transpose_groups
    groups = set_input_groups(self.line_length)
    transposed = []
    keys = key_order
    keys.each_pair do |order, loc|
      str = ""
      groups.each do |g|
        str << (g[loc].nil? ? " " : g[loc])
      end
      transposed << str
    end
    transposed
  end

  private

  def encrypt_message
    sanitize_input
    groups = transpose_groups
    self.output = ""
    code = ""
    groups.each do |t|
      code += t.strip
    end
    groups = code.scan(/.{#{self.output_line_length}}|.+/)
    groups.each do |g|
      self.output << "#{g}\n"
    end
  end

  def sanitize_input
    self.input.gsub!(/[^a-zA-Z]/, "")
    self.input.upcase!
    self.keyword.gsub!(/[^a-zA-Z]/, "")
    self.keyword.upcase!
    self.keyword = self.keyword.chars.uniq.join
  end
=begin
  def encrypt_line(line)
    code_count = 0
    result = ""
    line.chars.each do |c|
      code_count = 0 if code_count < self.keyword.length
      result += ALPHA_SQUARE[self.keyword[code_count]][ALPHA_TO_NUM[c]]
      code_count +=1
    end
    result
  end
=end

  def key_order
    keys = {}
    self.keyword.chars.sort.each_with_index do |c, index|
      keys[index] = self.keyword.index(c)
    end
    keys
  end

end
