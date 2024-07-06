require "colorize"
require_relative "lib/game"
require_relative "lib/ui_handler"
puts "test green".colorize(:green)
puts "test blue".colorize(:blue)
puts "test yellow".colorize(:yellow)
puts "test red".colorize(:red)
puts "test magenta".colorize(:magenta)
puts "test white".colorize(:white)
puts "test black".colorize(:black)
puts "test grey".colorize(:grey)

ui = UiHandler.new

color_array = %w[blue red green yellow magenta white black grey]

ui.print_introduction(color_array)
