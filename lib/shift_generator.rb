class ShiftGenerator
  def find_shifters(key)
    key.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def find_offsets(date)
    squared_date = date.to_i**2
    offset_data = squared_date.to_s[-4..-1]
  end

  def add_offsets_to_keys(offsets, keys)
    offsets.chars.map.with_index { |char, ind| char.to_i + keys[ind] }
  end

  def calculate_final_shifts(key, date)
    final_shifts_hash = {}
    large_array = add_offsets_to_keys(find_offsets(date), find_shifters(key))
    return reducer(large_array)
  end

  def reducer(array)
    reduced_array = []
    array.map! do |num|
      while num >= 27
        num -= 27
      end
    reduced_array << num
    end
    return reduced_array
  end

end
