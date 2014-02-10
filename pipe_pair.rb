require_relative "entity"
require_relative "pipe"

class PipePair < Entity
	attr_reader :pipes
	def initialize(window, offset)
		super(window)
		@pipe_top =  Pipe.new(@window, true, offset)
		@pipe_bottom = Pipe.new(@window, false, offset)	
	end

	def update
		@pipe_top.update
		@pipe_bottom.update

		if collide_x?(@window.calle) && collide_y?(@window.calle)
			@window.calle.kill
		elsif collide_x?(@window.calle) && !collide_y?(@window.calle)
			puts "got score!"
		end

	end

	def collide_x?(entity)
		return @pipe_top.collide_x?(entity)|| @pipe_bottom.collide_x?(entity)
	end

	def collide_y?(entity)
		return @pipe_top.collide_y?(entity) || @pipe_bottom.collide_y?(entity)
	end

	def draw
		@pipe_top.draw
		@pipe_bottom.draw
	end

end