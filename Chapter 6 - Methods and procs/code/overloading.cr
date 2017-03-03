# example 1
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

# example 2
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