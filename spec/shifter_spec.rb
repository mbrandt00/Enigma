require_relative './spec_helper'
require './lib/enigma'
require './lib/shifter'
require 'RSpec'
RSpec.describe Transformer do
  before(:each) do
  @enigma = Enigma.new
  @enigma.extend(Transformer)
  end
  it 'will read in Shifter files' do
    expect(@enigma.find_shifters(53421)). to eq([53, 34, 42, 21])
  end
end
