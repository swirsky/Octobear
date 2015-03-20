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
end
