require 'date'
require 'pry'
class Enigma
  attr_reader :today
  def initialize
  end

  def encrypt(message, key = self.generate_key, date = self.todays_date)
    # find_shifters(key)
    #return {
    # :encryption => encrypted_string,
    # :key => key usedfor encryption as string
    # :date => date used for encryption as string in DDMMYY
  # }
  p message, key, date
  end

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
