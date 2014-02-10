require_relative "entity"

class DrawableEntity < Entity
	attr_reader :x, :y, :width, :height,  :image, :alive
	def initialize(window, x, y, angle, sprite, scale = 1)
		super(window)
	    @image = sprite
	    @x = x
	    @y = y
	    @angle = 0.0
	    @scale = scale
	    @width = @image.width * @scale
	    @height = @image.height * @scale
	    @alive = true
	end

	def update
	end

	def kill
		@alive = false
	end

	def draw
		@image.draw_rot(@x, @y, 1, @angle, 0.0, 0.0, @scale, @scale)
	end
end