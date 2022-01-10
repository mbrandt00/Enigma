class ShiftGenerator
  def self.find_shifters(key)
    key.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def self.find_offsets(date)
    squared_date = date.to_i**2
    offset_data = squared_date.to_s[-4..-1]
  end

  def self.add_offsets_to_keys(offsets, keys)
    offsets.chars.map.with_index { |char, ind| char.to_i + keys[ind] }
  end

  def self.calculate_final_shifts(key, date)
    add_offsets_to_keys(find_offsets(date), find_shifters(key))
  end

end
