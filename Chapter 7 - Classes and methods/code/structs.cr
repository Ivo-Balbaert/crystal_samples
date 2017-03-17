struct Point
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end
end

p = Point.new(5, 3)
p p.class #=> Point : Class

# The array's buffer will have 8 bytes dedicated to each Point
ary = [] of Point

struct User
  property name, age

  def initialize(@name : String, @age : Int32)
  end

  def print
    puts "#{age} - #{name}"
  end
end

puts User.new("osman", 3).name   # => osman
User.new("ali", 9).print         # => 9 -ali