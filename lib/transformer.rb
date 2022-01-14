require 'pry'
require './lib/shift_generator'

class Transformer
  def charset
    ('a'..'z').to_a << ' '
  end

  def transform_letter(letter, value, operation)
    charset[charset.index(letter).send(operation, value) % 27]
  end

  def shift_message(message, key, date, operation)
    shift_values = ShiftGenerator.calculate_final_shifts(key, date)
    new_string = ''
    message.chars.each do |char|
      if charset.include?(char)
        new_string.concat(transform_letter(char, shift_values[0], operation))
        shift_values.rotate!(1)
      else
        new_string.concat(char)
      end
    end
    new_string
  end

  def encrypt(message, key, date)
    shift_message(message, key, date, :+)
  end

  def decrypt(message, key, date)
    shift_message(message, key, date, :-)
  end
end
