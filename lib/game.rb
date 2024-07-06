require_relative "ui_handler"
class Game
  attr_accessor :ui_handler

  def initialize
    ui_handler = UiHandler.new
    color_array = %w[blue red green yellow magenta white black grey]
  end
end
