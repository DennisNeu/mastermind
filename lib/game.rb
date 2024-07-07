require_relative "ui_handler"
require_relative "sequence_generator"
require_relative "comparator"
# Handles game loop
class Game
  def initialize(tries, sequence_length)
    @color_array = %w[blue red green yellow magenta white black grey]
    @ui_handler = UiHandler.new
    @sequence_generator = SequenceGenerator.new(@color_array)
    @comparator = Comparator.new
    @sequence_length = sequence_length
    @secret_sequence = @sequence_generator.generate_sequence(sequence_length)
    @tries = tries
    @guesses = []
    @feedback = []
  end

  def start_game
    @ui_handler.print_introduction(@color_array, @tries)
    while true

      player_choice
      generate_feedback
      @ui_handler.print_choice(@guesses.last)
      @ui_handler.print_feedback(@feedback.last)
      @ui_handler.print_tires_left(calculate_tries)
      if @feedback.last[:correct_positions] == 4
        @ui_handler.print_win
        break
      end

      if calculate_tries <= 0
        @ui_handler.print_gameover(@secret_sequence)
        break
      end
    end
    restart_game
  end

  # private

  def player_choice
    @ui_handler.print_text("To make a choice, enter four of the shown numbers seperated by spaces")
    puts @ui_handler.print_all_colors(@color_array)
    while true
      input = gets.chomp
      input_array = input.split.map(&:to_i)
      break if check_array(input_array)
    end
    input_array.map! { |item| item - 1 }
    @guesses << @color_array.values_at(*input_array)
    nil
  end

  def check_array(array)
    return false unless array.is_a?(Array) && array.length == 4

    array.all? { |element| element.is_a?(Integer) && element.between?(1, 8) }
  end

  def restart_game
    gets
    @guesses = []
    @tries_count = @tries_original
    @computer_guess_array = @sequence_generator.generate_sequence(@sequence_length)
    start_game
  end

  def calculate_tries
    @tries - @guesses.length
  end

  def generate_feedback
    @feedback << { correct_positions: @comparator.compare_right_positions(@secret_sequence, @guesses.last),
                   common_colors: @comparator.compare_common_colors(@secret_sequence, @guesses.last) }
  end
end
