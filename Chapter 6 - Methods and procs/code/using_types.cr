# Example 1
def add(x, y)   # works for numbers and strings
  x + y
end

p add 1, 2    # => 3
# p add true, 2 # => Error: no overload matches 'add' with types Bool, Int32
p add "Hello", " world" # => "Hello, world!"

def add2(x : Number, y : Number)  # restrict to numbers only
  x + y
end

def add2(x, y : Number)  # works too
  x + y
end

p add2 1, 2    # => 3
# p add2 "Hello", " world" # => Error: no overload matches 'add' with types String, String
p add2 1.0, 3.14 # => 4.14

def add3(x : Int, y : Int)  # restrict to integers only
  x + y
end

p add3 1, 2    # => 3
# p add3 1.0, 3.14 # => Error: no overload matches 'add' with types Float, Float

# Example 2
# A class that has a + method but isn't a Number
class Six
  def +(other)
    6 + other
  end
end

# add method without type restrictions
def add(x, y)
  x + y
end

# OK
add Six.new, 10

# add method with type restrictions
def restricted_add(x : Number, y : Number)
  x + y
end

# Error: no overload matches 'restricted_add' with types Six, Int32
restricted_add Six.new, 10

# Classes as restrictions
def foo(x : Int32.class)
end

foo Int32  # OK
foo String # Error

# Type restrictions in splats
def foo(*args : Int32)
end

def foo(*args : String)
end

foo 1, 2, 3       # OK, invokes first overload
foo "a", "b", "c" # OK, invokes second overload
foo 1, 2, "hello" # Error
foo()             # Error

# forall
def foo(x : T) forall T
  T
end

foo(1)       #=> Int32
foo("hello") #=> String

# Specifying a return type
def add3(x, y : Int) : Int # restrict to integers only
  x + y
end
 