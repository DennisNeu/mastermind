require_relative "ui_handler"
require_relative "guesser"

class Game
  def initialize(tries, sequence_length)
    @color_array = %w[blue red green yellow magenta white black grey]
    @ui_handler = UiHandler.new
    @guesser = Guesser.new(sequence_length, @color_array)
    @sequence_array = @guesser.generate_sequence
    @tries = tries
  end

  # private

  def get_player_choice
    @ui_handler.print_text("To make a choice, enter four of the shown numbers seperated by spaces")
    while true
      input = gets.chomp
      puts input
      input_array = input.split(" ").map(&:to_i)
      p input_array
      break if check_array(input_array)
    end
    input_array
  end

  def check_array(array)
    return false unless array.is_a?(Array) && array.length == 4

    array.all? { |element| element.is_a?(Integer) && element.between?(1, 8) }
  end
end
