require 'date'
require 'pry'
require './lib/transformer'
class Enigma
  attr_reader :valid_characters
  def initialize
    @valid_characters = ("a".."z").to_a << " "
  end
  include Transformer

  def encrypt(message, key = self.generate_key, date = self.todays_date)
    message = message.downcase
    reduced_shifts = reducer(calculate_final_shifts(key, date))
    new_string = []
    message.each_char.with_index do |char, index|
      if index % 4 == 0
        new_string << transform_letter(char, reduced_shifts['a'])
      elsif index % 4 == 1
        new_string << transform_letter(char, reduced_shifts['b'])
      elsif index % 4 == 2
        new_string << transform_letter(char, reduced_shifts['c'])
      elsif index % 4 == 3
        new_string << transform_letter(char, reduced_shifts['d'])
      end
    end
    binding.pry
    return new_string.to_s
  end

    #return {
    # :encryption => encrypted_string,
    # :key => key usedfor encryption as string
    # :date => date used for encryption as string in DDMMYY
  # }

  def unencrypt(ciphertext, key, date)
    # returns {
    # :decryption => decrypted String
    # :key => key used for encryption as string
    # :date => date used for decryption as a String in DDMMYY
  # }
  end

  def generate_key
    random_number = rand(0..99999)
    return random_number.to_s.rjust(5,'0')
  end

  def todays_date
    today = Date.today.strftime('%m%d%y')
  end

end
a = Enigma.new
p a.generate_key
# binding.pry
