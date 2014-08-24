require "gosu"
require_relative "player"
require_relative "pipe"
require_relative "map_controler"

class GameWindow < Gosu::Window
	attr_reader :calle
	def initialize
		super 1024, 769, false
		self.caption = "Flappy Calle"
		@calle = Player.new(self)
		@map_controler = MapControler.new(self)
	end

	def update
		@calle.update
		@map_controler.update
		if !calle.alive
			@calle = null
		end
	end

	def draw
		@calle.draw
		@map_controler.draw
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show
