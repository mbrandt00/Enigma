require 'date'
class Enigma
  def initialize
  end

  def encrypt(message,key=random_key,date=todays_date)
    #return {
    # :encryption => encrypted_string,
    # :key => key usedfor encryption as string
    # :date => date used for encryption as string in DDMMYY
  # }
  end

  def encrypt(ciphertext, key, date)
    # returns {
    # :decryption => decrypted String
    # :key => key used for encryption as string
    # :date => date used for decryption as a String in DDMMYY
  # }
  end

end
