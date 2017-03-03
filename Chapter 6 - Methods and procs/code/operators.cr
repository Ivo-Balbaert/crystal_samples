# Define an operator for a type
struct Vector2
  getter x, y

  def initialize(@x : Int32, @y : Int32)
  end

  def +(other)
    Vector2.new(x + other.x, y + other.y)
  end

  def -
    Vector2.new(-x, -y)
  end
end

v1 = Vector2.new(1, 2)
v2 = Vector2.new(3, 4)
p v1 + v2               #=> Vector2(@x=4, @y=6)

v1 = Vector2.new(1, 2)
-v1                    #=> Vector2(@x=-1, @y=-2)

# Defining indexing operator
class MyArray
  def [](index)
    # ...
  end

  def [](index1, index2, index3)
    # ...
  end

  def []=(index, value)
    # ...
  end
end

array = MyArray.new

array[1]       # invokes the first method
array[1, 2, 3] # invokes the second method
array[1] = 2   # invokes the third method

array.[](1)       # invokes the first method
array.[](1, 2, 3) # invokes the second method
array.[]=(1, 2)   # invokes the third method