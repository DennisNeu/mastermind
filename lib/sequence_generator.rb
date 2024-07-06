# Class is used to generate a random sequence
class SequenceGenerator
  def initialize(color_array)
    @color_array = color_array
  end

  def generate_sequence(sequence_length)
    @color_array.shuffle.pop(sequence_length)
  end
end
