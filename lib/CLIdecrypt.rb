require './lib/CLI'
require './lib/enigma'
class CLIdecrypt < CLI

  attr_reader :message_location, :new_file_location, :key, :date
  def initialize(crack = false) # if false there is no [2] or [3]
    @crack = crack
    @enigma = Enigma.new
    @message_location = ARGV[0]
    @new_file_location = ARGV[1]
    @key = crack ? nil : ARGV[2]
    @date = crack ?  ARGV[2] : ARGV[3]
    self.decrypt_checks
    @message_data = read_in_data(@message_location).chop

  end

  def decrypt_checks
    file_exists?
    if ARGV.length != 4 && @crack == false
      puts "Please enter 4 arguments: "
      puts "(1) the path of the message to be decrypted"
      puts "(2) the path of the new .txt file"
      puts "(3) the key to decrypt."
      puts "(4) the date to decrypt"
      exit
    end
    if ARGV.length <3 && @crack == true
      puts "Please enter 3 arguments: "
      puts "(1) the path of the message to be cracked"
      puts "(2) the path of the new .txt file"
      puts "(3) the date the message was encrypted"
      exit
    end

  end

  def decrypt_to_file(location = @new_file_location, key = @key, date = @date)
    decrypted = @enigma.decrypt(@message_data, key, @date)

    new_file = File.open(@new_file_location, 'w')
    new_file.puts(decrypted[:decryption])
    new_file.close
    puts "Created #{@new_file_location} with cracked key #{decrypted[:key]} and date #{decrypted[:date]}"
  end

  def crack_to_file
    key = @enigma.brute_force_crack(@message_data, @date) # returns key
    decrypt_to_file(@new_file_location, key, @date)
  end
end
# ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
# Created 'cracked.txt' with the cracked key 82648 and date 240818
