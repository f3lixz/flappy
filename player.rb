require_relative "drawable_entity"

class Player < DrawableEntity
	def initialize(window)
		super(window, 200, 384, 0.0, Gosu::Image.new(window, "resources/images/calle.png", false))
		@velocity = 10
    	@spacePressed = false
	end

	def update
		if @window.button_down? Gosu::KbSpace
	      if !@spacePressed
	        @spacePressed = true
	        @velocity = -15
	      end
	    end

	    if !@window.button_down? Gosu::KbSpace
	      @spacePressed = false
	    end
	    if @y + @velocity >  0 &&  @y + @velocity < 768
			@y += @velocity			
		end
		@velocity += 1
	end
end