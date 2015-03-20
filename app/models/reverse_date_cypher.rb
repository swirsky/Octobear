class ReverseDateCypher < ActiveRecord::Base
  include CryptoHelper
  #reverse each line, encrypts based on date
  belongs_to :user

  attr_accessor :date_year, :date_month, :date_day

  LINE_LENGTH = 25

  validates_presence_of :input

  before_save :encrypt_message

  def line_length
    LINE_LENGTH
  end

  private

  def encrypt_message
    set_date_cypher
    sanitize_input
    input_groups = set_input_groups(LINE_LENGTH)
    self.output = ""
    input_groups.each do |g|
      self.output << "#{encrypt_line(g, self.date_cypher)}\n"
    end
  end

  def encrypt_line(line, cypher)
    e_l = ""
    line.chars.reverse.each do |c|
      if c.blank?
        e_l << " "
      else
      lookup_num = (ALPHA_TO_NUM[c]+cypher)%26
      e_l << ALPHA_LOOKUP[lookup_num]
      end
    end
    e_l
  end

  def sanitize_input
      self.input.gsub!(/[^a-zA-Z0-9\s]/, "")
      self.input.upcase!
  end

  def set_date_cypher
    self.date_cypher ||= ((self.date_year + self.date_month)%26 + self.date_day)%26
  end

end
