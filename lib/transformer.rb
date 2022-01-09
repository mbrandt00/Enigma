require 'pry'


module Transformer
  def find_shifters(key)
    if key.to_s.length == 5
      key = key.split('')
      a_key = key[0..1].join.to_i
      b_key = key[1..2].join.to_i
      c_key = key[2..3].join.to_i
      d_key = key[3..4].join.to_i
      keys = [a_key, b_key, c_key, d_key]
    else
      return false
    end
    return keys
  end

  def find_offsets(date)
    squared_date = date.to_i**2
    offset_data = squared_date.to_s[-4..-1]
    a_offset = offset_data[0].to_i
    b_offset = offset_data[1].to_i
    c_offset = offset_data[2].to_i
    d_offset = offset_data[3].to_i
    return offsets = [a_offset, b_offset, c_offset, d_offset]
  end

  def calculate_final_shifts(key, date)
    final_shifts_hash = {}
    i = 0
    until i == 4
      final_shifts_hash[i] = find_shifters(key)[i] + find_offsets(date)[i]
      i +=1
    end
    key_map = {0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd'}
    return final_shifts_hash.transform_keys! {|k| key_map[k]}
  end
end
