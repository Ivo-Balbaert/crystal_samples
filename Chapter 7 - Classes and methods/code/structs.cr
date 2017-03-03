struct Point
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end
end

# The array's buffer will have 8 bytes dedicated to each Point
ary = [] of Point