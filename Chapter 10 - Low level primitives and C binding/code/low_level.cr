# pointerof
# example with a variable:
a = 1

# p a.object_id   # undefined method 'object_id' for Int32
ptr = pointerof(a)
ptr.value = 2

a #=> 2

# example with an instance variable:
class Point
  def initialize(@x, @y)
  end

  def x
    @x
  end

  def x_ptr
    pointerof(@x)
  end
end

point = Point.new 1, 2

ptr = point.x_ptr
ptr.value = 1

point.x #=> 1

# sizeof
sizeof(Int32)  #=> 4
sizeof(Int64)  #=> 8

# Reference types, sizeof = pointer size, on a 64 bits machine
sizeof(Pointer(Int32)) #=> 8
sizeof(String)         #=> 8

a = 1
sizeof(typeof(a)) #=> 4

# instance_sizeof
class Point
  def initialize(@x, @y)
  end
end

Point.new 1, 2

# 2 x Int32 = 2 x 4 = 8
instance_sizeof(Point) #=> 12

# uninitialized
x = uninitialized Int32
x #=> some random value, garbage, unreliable, mostly (???) 0

# used for declaring uninitialized StaticArray buffers without a performance penalty:
buffer = uninitialized UInt8[256]