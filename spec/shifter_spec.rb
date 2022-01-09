require_relative './spec_helper'
require './lib/enigma'
require './lib/shifter'
require 'RSpec'
require 'pry'
RSpec.describe Transformer do
  before(:each) do
  @enigma = Enigma.new
  @enigma.extend(Transformer)
  end
  it 'will read in Shifter files' do
    expect(@enigma.find_shifters('53421')). to eq([53, 34, 42, 21])
  end
  it 'will recognize if key is too short' do
    expect(@enigma.find_shifters('30')).to be(false)
  end 

  it 'will find the offsets from a date' do
    expect(@enigma.find_offsets('100822')).to eq([5,6,8,4])
  end

  it 'will calculate the final shifts' do
    expect(@enigma.calculate_final_shifts('53421', '100822')).to eq("a" => 58,"b" => 40, "c" => 50, "d" => 25)
  end
end
