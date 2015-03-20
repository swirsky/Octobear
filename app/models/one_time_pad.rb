class OneTimePad < ActiveRecord::Base
  include CryptoHelper
  belongs_to :user

  validates_presence_of :input

  before_save :generate_output

  attr_accessor :number_of_lines

  def blockify_input(string=false)
    if string
      str = ""
      number_of_lines.times do |i|
        line = self.input[(self.line_length*i)..((self.line_length*i)+self.line_length-1)]
        str += "#{line.scan(/.{#{self.group_length}}|.+/).join(" ")}\n"
      end
      blockify(str)
    else
      self.formatted_blockify(self.get_lines)
    end
  end

  def blockify_output(string=false)
    if string
      super
    else
      self.formatted_blockify(self.get_encoded_lines)
    end
  end

  def blockify_cypher(string=false)
    if string
      self.blockify(cypher)
    else
      self.formatted_blockify(self.get_cypher_lines)
    end
  end

  def number_of_lines
    (self.input.length/self.line_length).to_i + 1
  end

  def get_lines
    lines = []
    number_of_lines.times do |i|
      line = self.input[(self.line_length*i)..((self.line_length*i)+self.line_length-1)]
      lines << "#{line.scan(/.{#{self.group_length}}|.+/).join(" ")}"
    end
    lines
  end

  def get_cypher_lines
    lines = []
    number_of_keys.times do |i|
      line = self.cypher.gsub(' ', '')[(self.line_length*i)..((self.line_length*i)+self.line_length-1)]
      lines << "#{line.scan(/.{#{self.group_length}}|.+/).join(" ")}"
    end
    lines
  end

  def get_encoded_lines
    lines = []
    number_of_lines.times do |i|
      line = self.output.gsub(' ', '')[(self.line_length*i)..((self.line_length*i)+self.line_length-1)]
      lines << "#{line.scan(/.{#{self.group_length}}|.+/).join(" ")}"
    end
    lines
  end

  private

    def generate_output
      sanitize_input
      self.key_length = self.key_length ? self.key_length : 25
      self.group_length = self.group_length ? self.group_length : 5
      self.line_length = self.line_length ? self.line_length : 25
      self.number_of_keys = self.number_of_keys ? self.number_of_keys : (self.input.length/self.line_length).to_i + 1
      self.output = ""
      self.cypher = ""
      input_groups = get_input_groups
      keys = generate_keys
      self.number_of_keys.times do |i|
        puts "Starting cypher loop at #{i}"
        self.cypher += "#{keys[i].scan(/.{#{self.group_length}}|.+/).join(" ")}\n"
        self.output += "#{encrypt(input_groups[i], keys[i])}\n" if input_groups[i]
      end
    end

    def sanitize_input
      self.input.gsub!(/\W+/, "")
      self.input.gsub!(/(0-9|_)/, "")
      self.input.gsub!("J", "I")
      self.input.upcase!
    end

    def generate_key
      self.seed = (Time.now.to_f*100000).to_i
      key = ""
      self.key_length.times do |i|
        key += ALPHA25_LOOKUP[rand(seed)%25]
      end
      key
    end

    def generate_keys
      keys = []
      self.number_of_keys.times do |i|
        keys << generate_key
      end
      keys
    end

    def encrypt(string, key)
      output_str = ""
      string.length.times do |i|
        if i != 0 && i != self.line_length && i%self.group_length == 0
          output_str += " "
        end
        puts "================"
        puts "IN ENCRYPT"
        puts "i: #{i}"
        puts "string: #{string}"
        puts "key: #{key}"
        puts "==============="
        output_str += ALPHA25_LOOKUP[(ALPHA25_TO_NUM[string[i]] + ALPHA25_TO_NUM[key[i]])%25]
      end
      output_str
    end

    def get_input_groups
      groups = []
      self.number_of_keys.times do |i|
        groups << self.input[(self.line_length*(i))..((self.line_length*(i))+self.line_length-1)]
      end
      groups
    end
end
