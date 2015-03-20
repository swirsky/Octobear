module CryptoHelper
  ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  ALPHA_LOOKUP = ALPHABET.inject({}) do |hash, letter| 
                                          hash[hash.count] = letter
                                          hash
                                     end
  ALPHA_TO_NUM = ALPHABET.inject({}) do |hash, letter|
                                          hash[letter] = hash.count
                                          hash
                                     end
  ALPHA_SQUARE = ALPHABET.inject({}) do |hash, letter|
                                          hash[letter] = ALPHABET.rotate(hash.count)
                                          hash
                                     end

  ALPHA25 = %w(A B C D E F G H I K L M N O P Q R S T U V W X Y Z)
  ALPHA25_LOOKUP = ALPHABET.inject({}) do |hash, letter| 
                                          hash[hash.count] = letter
                                          hash
                                     end
  ALPHA25_TO_NUM = ALPHABET.inject({}) do |hash, letter|
                                          hash[letter] = hash.count
                                          hash
                                     end


  def blockify(string)
    return string.gsub(/\n/, '<br>')
  end

  def set_input_groups(line_length)
    groups = []
    ((self.input.length/line_length)+1).times do |i|
      groups << self.input[(i*line_length)..((i*line_length)+line_length-1)]
    end
    groups
  end

  def blockify_input
    input_groups = set_input_groups(self.get_line_length)
    blocker = ""
    input_groups.each do |g|
      blocker << "#{g}\n"
    end
    blockify(blocker)
  end

  def blockify_output
    blockify(self.output)
  end


end
