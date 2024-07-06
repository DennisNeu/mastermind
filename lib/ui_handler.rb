require "colorize"

class UiHandler
  def print_introduction(color_array)
    print_seperator_new_line

    puts "This is a game of mastermind"
    puts "The computer will randomly determine a sequence of four of the following colors:"
    puts print_colors(color_array)

    print_seperator_new_line
  end

  def print_colors(color_array)
    string = ""
    color_array.each { |color| string.concat("#{color.colorize(color.to_sym)} ") }
    string
  end

  def print_text(string)
    print_seperator_new_line
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
