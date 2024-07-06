require "colorize"
# Handles all text printed to terminal window
class UiHandler
  def print_introduction(color_array, tries)
    print_seperator_new_line

    puts "This is a game of mastermind"
    puts "The computer will randomly determine a sequence of four of the following colors:"
    puts print_all_colors(color_array)
    puts ""
    puts "You have to guess the correct sequence. You have #{tries.to_s.colorize(:red)} tries!"

    print_seperator_new_line
  end

  def print_all_colors(color_array)
    string = ""
    color_array.each_with_index { |color, index| string.concat("#{index + 1}: #{color.colorize(color.to_sym)} ") }
    string
  end

  def print_text(string)
    puts string
    print_seperator_new_line
  end

  private

  def print_seperator_new_line
    puts ""
    print_seperator
    puts ""
  end

  def print_seperator
    puts "#" * 18
  end
end
