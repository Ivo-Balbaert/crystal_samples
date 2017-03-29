class Point
  def initialize(@x : Int32, @y : Int32)
  end

  def to_s(io)
    io << "(" << @x << ", " << @y << ")"
  end
end

p = Point.new(3, 5)
p p.to_s  # => "(3, 5)"