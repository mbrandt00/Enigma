require './lib/CLI'

class CLIencrypt < CLI
  # attr_reader :message_location, :new_file_location, :enigma
  def initialize
    @message_location = ARGV[0]
    @new_file_location = ARGV[1]
    self.encrypt_checks
    @message_data = read_in_data(@message_location)
    @enigma = Enigma.new
  end
  def encrypt_checks
    file_exists?
    unless ARGV.length == 2
      puts "Please enter two arguments: "
      puts "(1) the path of the message to be encrypted"
      puts "(2) the path of the encrypted message"
      exit
    end
  end

    def encrypt_to_file(location = @new_file_location)
      encrypt_checks
      encrypted = @enigma.encrypt(@message_data)
      new_file = File.open(@new_file_location, 'w')
      new_file.puts(encrypted[:encryption])
      new_file.close
      puts "Created #{location} with key #{encrypted[:key]} and date #{encrypted[:date]}"
    end
end
