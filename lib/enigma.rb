require 'date'
require 'pry'
require './lib/transformer'
require './lib/shift_generator'
class Enigma
  def encrypt(message, key = generate_key, date = todays_date)
    message = message.downcase
    hash_preparer(Transformer.new.encrypt(message, key, date), key, date, 'e')
  end

  def decrypt(ciphertext, key, date = todays_date)
    hash_preparer(Transformer.new.decrypt(ciphertext, key, date), key, date, 'd')
  end

  def generate_key
    random_number = rand(0..99_999)
    random_number.to_s.rjust(5, '0')
  end

  def todays_date
    today = Date.today.strftime('%m%d%y')
  end

  def brute_force_crack(encrypted_message, date = todays_date)
    samples = (0...100_000).to_a
    print 'cracking...'
    count = 0
    loop do
      key = samples[0].to_s.rjust(5, '0')
      a = Transformer.new.decrypt(encrypted_message, key, date)[-4..-1]
      if a == ' end'
        return key
        # break
      end
      count += 1
      p "Checked #{count} combinations so far." if count % 10_000 == 0
      samples.rotate!(1)
    end
  end

  def hash_preparer(text, key, date, type)
    if type == 'e'
      { encryption: text, key: key, date: date }
    elsif type == 'd'
      { decryption: text, key: key, date: date }
    end
  end
end
