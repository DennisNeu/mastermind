require_relative "lib/game"
require_relative "lib/ui_handler"

ui = UiHandler.new

color_array = %w[blue red green yellow magenta white black grey]

ui.print_introduction(color_array, 12)

game = Game.new(color_array, 4)

puts game.player_choice
