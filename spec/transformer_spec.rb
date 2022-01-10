require_relative './spec_helper'
require './lib/enigma'
require './lib/transformer'
require 'RSpec'
require 'pry'
RSpec.describe Transformer do
  before(:each) do
    @transformer = Transformer.new
  end
  it 'will have all of the valid characters saved' do
    expect(@transformer.charset).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    expect(@transformer.charset.length).to eq(27)
  end
  it 'will transform a character forward' do
    expect(@transformer.transform_letter('b', 2, :+)).to eq('d')
  end
  it 'will transform a character backwards' do
    expect(@transformer.transform_letter('d', 3, :-)).to eq('a')
  end
  it 'will transform a character past the confines of the array' do
    expect(@transformer.transform_letter('d', 8, :-)).to eq('w')
    expect(@transformer.transform_letter('b', 28, :+)).to eq('c')
  end
  it 'will shift a message' do
    expect(@transformer.shift_message('hello world!', '02715', '040895', :+)).to eq('keder ohulw!')
  end
  it 'will shift only valid characters' do
    expect(@transformer.shift_message('#@)*(&)', '02715', '040895', :+)). to eq('#@)*(&)')
  end
  it 'will encrypt a message' do
    expect(@transformer.encrypt('hello world!', '02715', '040895')).to eq('keder ohulw!')
  end
  it 'will decrypt a message' do
    expect(@transformer.decrypt('keder ohulw!', '02715', '040895')).to eq('hello world!')
  end
end
