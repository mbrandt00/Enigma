require 'pry'


module Transformer
  def find_shifters(key)
    if key.to_s.length == 5
      key = key.to_s.split('')
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
    
  end
end
