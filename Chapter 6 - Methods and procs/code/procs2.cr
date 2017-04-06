# Passing a proc literal to a method
def some_proc(&block : Int32 -> Int32)
  block
end

x = 0
proc = ->(i : Int32) { x += i }
proc = some_proc(&proc)
proc.call(1)  #=> 1
proc.call(10) #=> 11
x #=> 11

# Forwarding and invoking a block
def capture(&block)
  block
end

def invoke(&block)
  block.call
end

proc = capture { puts "Hello" }
invoke(&proc) # prints "Hello"
# invoke(proc) # Error: wrong number of arguments for 'invoke' (1 for 0)

# Pass a proc to a method that yields
def capture(&block)
  block
end

def twice
  yield
  yield
end

proc = capture { puts "Hello" }
twice &proc

# shorter
def say_hello
  puts "Hello"
end

twice &->say_hello

# To forward non-captured blocks use yield
def foo
  yield 1
end

def wrap_foo
  puts "Before foo"
  foo do |x|
    yield x
  end
  puts "After foo"
end

wrap_foo do |i|
  puts i
end

# =>
# Before foo
# 1
# After foo

# Captured blocks and proc literals closure local variables and self
# example 1A
y = 42
f = ->(x: Int32) {x + y}
f.call(5) # => 47
y = 20
f.call(5) # => 25

# example 1B
x = 0
proc = ->{ x += 1; x }
proc.call #=> 1
proc.call #=> 2
x         #=> 2

# example 2: proc returned from a method
def counter
  x = 0
  ->{ x += 1; x }
end

proc = counter
proc.call #=> 1
proc.call #=> 2

# Type of closured variables
def foo
  yield
end

x = 1
foo do
  x = "hello"
end
x # : Int32 | String (improve in future to only Int32 ?)

x = 'a'
x # : Char

# if closured by a proc, the type is always the mixed type of all assignments 
def capture(&block)
  block
end

x = 1
capture { x = "hello" }

x = 'a'
x # : Int32 | String | Char

f = ->(x : Int32) { puts x }
10.times &f

def new_counter
  a = 0
  ->{ a +=1; a}
end

counter = new_counter
counter.call    # =>  1
counter.call    # =>  2

counter2 = new_counter
counter.call    # =>  1

# Captured block
def capture(&block : Int32 -> Int32)
  block
end

a = 10
proc = capture {|x| x + a}
proc.call(1)  # => 11

a = 20
proc.call(1)  # => 21