require './lib/enigma'
require 'pry'
class CLI
  attr_reader :message_location, :new_file_location, :enigma
  def initialize
    @new_file_location = new_file_location
    @enigma = Enigma.new
    @message_location = message_location
  end

  def file_exists?(location = @message_location)
    unless File.exists?(location)
      puts 'please enter a valid file path to be encrypted'
      exit
    end
  end


  def read_in_data(message_location = @message_location)
    @message_data = IO.read(message_location)
  end

end
