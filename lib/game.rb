require_relative "ui_handler"
require_relative "guesser"

class Game
  def initialize(tries, sequence_length)
    @color_array = %w[blue red green yellow magenta white black grey]
    @ui_handler = UiHandler.new
    @guesser = Guesser.new(sequence_length, @color_array)
    @sequence_array = guesser.generate_sequence
  end
end
