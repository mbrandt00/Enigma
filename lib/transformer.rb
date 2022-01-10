require 'pry'
require './lib/shift_generator'


class Transformer

  def charset
    ("a".."z").to_a << " "
  end

  def transform_letter(letter, value, operation)
    charset[charset.index(letter).send(operation, value) % 27]
  end

  def shift_message(message, key, date, operation)
    shift_values = ShiftGenerator.generate_shift_values(key, date)
  end

end
a = Transformer.new
binding.pry
