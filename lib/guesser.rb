class Guesser
  def initialize(sequence_length, color_array)
    @sequence_length = sequence_length
    @color_array = color_array
  end

  def generate_sequence
    sequence_array = @color_array.shuffle.pop(@sequence_length)
  end
end
