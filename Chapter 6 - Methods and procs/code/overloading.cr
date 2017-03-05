# example 1
def double(i)
  i * 2
end

# 3 different methods are compiled
p answer = double(3)  # => 6
puts typeof(answer)   # => Int32

p answer2 = double(3.14)    # => 6.28
puts typeof(answer2)        # => Float64

p answer3 = double("hi")    # => "hihi"
puts typeof(answer3)        # => String    


# example 2
def add(x, y)   
  x + y
end

def add(x : Number, y : Number)  
  x + y
end

def add(x : Int, y : Int)  
  x + y
end

p add 1, 2    # => 3
p add 1.0, 3.14 # => 4.14
p add "Hello,", " world!" # =>  "Hello, world!"

def add(x: Number, y: String)
    x.to_s + y
end

p add 3, "Crystal"  # => "3Crystal"

# example 3
# foo 1
def foo(x, y)
  x + y
end

# foo 2
def foo(x)
    puts x
end

# foo 3
def foo(x : Float)
    puts x
end

# foo 4
def foo(x)
  yield
end

foo 1, 1      # Invokes foo 1
foo 1         # Invokes foo 2
foo 1.5       # Invokes foo 3
foo(1) { puts "yield" }    # Invokes foo 4

# example 4
def foo(a : Int, b : Char)
  1
end

def foo(a : Bool, b : Char)
  2
end

def foo(a, b : Char)
  3
end

def foo(a, b)
  4
end

foo 3, 'c'      # => 1
foo true, 'c'   # => 2
foo :hi, 'c'    # => 3
foo :hi, :c     # => 4

# example 5
class Increment
  getter :amount

  def initialize
    @amount = 0
  end

  def increment
    @amount += 1
  end

  def increment(inc_amount)
    @amount += inc_amount
  end
end

inc = Increment.new
inc.increment
p inc.amount   # => 1
inc.increment(5)
p inc.amount   # => 6
