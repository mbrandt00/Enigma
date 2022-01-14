require_relative './spec_helper'
require './lib/shift_generator'
require 'RSpec'
RSpec.describe ShiftGenerator do
  before(:each) do
    @shift_generator = ShiftGenerator
  end
  it 'will find shifters' do
    expect(@shift_generator.find_shifters('53421')).to eq([53, 34, 42, 21])
  end
  it 'will find the offsets from a date' do
    expect(@shift_generator.find_offsets('100822')).to eq('5684')
  end

  it 'will calculate the final shifts' do
    expect(@shift_generator.calculate_final_shifts('53421', '100822')).to eq([58, 40, 50, 25])
  end
end
