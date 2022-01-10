require 'date'
require 'pry'
require './lib/transformer'
require './lib/shift_generator'
class Enigma

  def encrypt(message, key = self.generate_key, date = self.todays_date)
    message = message.downcase
    self.hash_preparer(Transformer.new.encrypt(message, key, date), key, date, 'e')
  end


  def unencrypt(ciphertext, key, date)
    self.hash_preparer(Transformer.new.decrypt(ciphertext, key, date), key, date, 'd')
  end

  def generate_key
    random_number = rand(0..99999)
    return random_number.to_s.rjust(5,'0')
  end

  def todays_date
    today = Date.today.strftime('%m%d%y')
  end

  def hash_preparer(text, key, date, type)
    if type == 'e'
      return {:encryption => text, :key => key, :date => date}
    elsif type == 'd'
      return {:decryption => text, :key => key, :date => date}
    end
  end
end
# a = Enigma.new
# p a.encrypt('Valar Dohaeris')
# p a.unencrypt('txwipwowfxpzgo', '25031', '010922')
# binding.pry
