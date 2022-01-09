require_relative './spec_helper'
require './lib/enigma'
require 'RSpec'
require 'pry'
RSpec.describe Enigma do
  before(:each) do
  @enigma = Enigma.new
  end
  it 'will return an encrypted message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq('keder ohulw')
  end
end
