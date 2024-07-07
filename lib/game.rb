require_relative "ui_handler"
require_relative "sequence_generator"
# Handles game loop
class Game
  def initialize(tries, sequence_length)
    @color_array = %w[blue red green yellow magenta white black grey]
    @ui_handler = UiHandler.new
    @sequence_generator = SequenceGenerator.new(@color_array)
    @computer_guess_array = @sequence_generator.generate_sequence(sequence_length)
    @tries_original = tries
    @tries_count = tries
    @guesses = []
  end

  def start_game
    while true

    end
    restart_game
  end

  # private

  def player_choice
    @ui_handler.print_text("To make a choice, enter four of the shown numbers seperated by spaces")
    while true
      input = gets.chomp
      input_array = input.split(" ").map(&:to_i)
      break if check_array(input_array)
    end
    @guesses << input_array
    nil
  end

  def check_array(array)
    return false unless array.is_a?(Array) && array.length == 4

    array.all? { |element| element.is_a?(Integer) && element.between?(1, 8) }
  end

  def restart_game
    @guesses = []
    @tries_count = @tries_original
    @computer_guess_array = @sequence_generator.generate_sequence
  end
end
