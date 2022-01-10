require './lib/enigma'
require 'pry'
class CLI
  attr_reader :message_data, :message_location, :new_file_location, :enigma
  def initialize
    @message_data = message_data
    @message_location = ARGV[0]
    @new_file_location = ARGV[1]
    @enigma = Enigma.new
  end

  unless ARGV.length == 2
    puts "Please enter two arguments: "
    puts "(1) the path of the message to be encrypted"
    puts "(2) the path of the encrypted message"
    exit
  end

  unless File.exists?(location = ARGV[0].to_s)
    puts 'please enter a valid file path to be encrypted'
    exit
  end

  def read_in_data(message_location = @message_location)
    @message_data = IO.read(message_location)
  end

  def encrypt_to_file(location = @new_file_location)
    read_in_data(@message_location)
    encrypted = @enigma.encrypt(@message_data)
    new_file = File.open(@new_file_location, 'w')
    new_file.puts(encrypted[:encryption])
    new_file.close
    puts "Created #{location} with key #{encrypted[:key]} and date #{encrypted[:date]}"
  end
end
