class Player
  ROTATION_SPEED = 3
  ACCELERATION = 2
  FRICTION = 0.9

  attr_reader :x, :y, :angle, :radius

  # TODO: refactor
  def initialize(window)
    @x = 200
    @y = 200
    @angle = 0
    @image = Gosu::Image.new('../lib/images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
    @radius = 20
    @window = window
  end

  def draw
    # NOTE: draws the image rotated by any angle
    # measured in degrees
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def turn_right
    @angle += ROTATION_SPEED
  end

  def turn_left
    @angle -= ROTATION_SPEED
  end

  def accelerate
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
  end

  def move
    @x += @velocity_x
    @y += @velocity_y

    # NOTE: slow down the ship by multiplying the
    # velocities by 0.9 this acts like a sort of
    # friction that makes controlling the ship a
    # little easier
    @velocity_x *= FRICTION
    @velocity_y *= FRICTION

    if @x > @window.width - @radius
      @velocity_x = 0
      @x = @window.width - @radius
    end

    if @x < @radius
      @velocity_x = 0
      @x = @radius
    end

    if @y > @window.height - @radius
      @velocity_y = 0
      @y = @window.height - @radius
    end

    if @y < @radius
      @velocity_y = 0
      @y = @radius
    end
  end
end
