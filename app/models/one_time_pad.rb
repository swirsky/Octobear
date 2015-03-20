class OneTimePad < ActiveRecord::Base
  include CryptoHelper
  belongs_to :user

  validates_presence_of :input

  before_save :generate_output
=begin
  def initialize(attributes={})
    @input = attributes[:input].gsub(/\W+/, "")
    @key_length = attributes[:key_length] ? attributes[:key_length] : 25
    @group_length = attributes[:group_length] ? attributes[:group_length] : 5
    @line_length = attributes[:line_length] ? attributes[:line_length] : 25
    @number_of_keys = (@input.length/@line_length).to_i + 1
  end
=end

  def blockify_input
    str = ""
    self.number_of_keys.times do |i|
      line = self.input[(self.line_length*i)..((self.line_length*i)+self.line_length-1)]
      str += "#{line.scan(/.{5}|.+/).join(" ")}\n"
    end
    blockify(str)
  end

  def blockify_cypher
    blockify(self.cypher)
  end

  def blockify_output
    blockify(self.output)
  end

  private

    def generate_output
      sanitize_input
      self.key_length = attributes[:key_length] ? attributes[:key_length] : 25
      self.group_length = attributes[:group_length] ? attributes[:group_length] : 5
      self.line_length = attributes[:line_length] ? attributes[:line_length] : 25
      self.number_of_keys = (self.input.length/self.line_length).to_i + 1
      self.output = ""
      self.cypher = ""
      input_groups = get_input_groups
      self.number_of_keys.times do |i|
        puts "Starting cypher loop at #{i}"
        key = generate_key
        self.cypher += "#{key.scan(/.{5}|.+/).join(" ")}\n"
        self.output += "#{encrypt(input_groups[i], key)}\n"
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

    def encrypt(string, key)
      output_str = ""
      string.length.times do |i|
        if i != 0 && i != self.line_length && i%5 == 0
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
      puts groups.inspect
      groups
    end
end
