class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from(other)
    Math.hypot(@x - other.x, @y - other.y)
  end
end
