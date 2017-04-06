# If a method returns an array, you can use destructuring assignment
def foods
    ["pancake", "sandwich", "quesadilla"]
end
breakfast, lunch, dinner = foods
p breakfast #=> "pancake"
p dinner    #=> "quesadilla"

# same with tuple  {"pancake", "sandwich", "quesadilla"}

# Splat operator ("*") = reverse of destructuring
# Pass a list of arguments, which will be converted into a tuple or array(???)
def guests(*tuple)
  tuple.each { |guest| puts guest }
end

p guests()  # => blank
p guests("John") # => "John"
p guests("John", "Donald", "Mike")
# => "John"
# => "Donald"
# => "Mike"

def sum(*elements)
  total = 0
  elements.each do |value|
    total += value
  end
  total
end

sum 1, 2, 3    #=> 6        # elements is Tuple(Int32, Int32, Int32)
sum 1, 2, 3, 4.5 #=> 10.5   # elements is Tuple(Int32, Int32, Int32, Float64)

# Arguments past the splat argument can only be passed as named arguments:
# if without default value, the named argument is required as parameter
def sum(*elements, initial = 0)
  total = initial
  elements.each do |value|
    total += value
  end
  total
end

sum 1, 2, 3 # => 6
sum 1, 2, 3, initial: 10 # => 16

def join(*args, with joiner)
  String.build do |str|
    args.each_with_index do |arg, index|
      str << joiner if index > 0
      str << arg
    end
  end
end

join 1, 2, 3 with: "-"          # =>  "1-2-3"
join 1, 2, 3, 4, 5 with: "~"    # =>  "1~2~3~4~5"

# Splatting a tuple
def foo(x, y)
  x + y
end

tuple = {1, 2}
foo *tuple # => 3

# Double splats and named tuples
def foo(x, **other)
  # Return the captured named arguments as a NamedTuple
  other
end

foo 1, y: 2, z: 3    # => {y: 2, z: 3}
foo y: 2, x: 1, z: 3 # => {y: 2, z: 3}

# Double splatting a named tuple
def foo(x, y)
  x - y
end

tuple = {y: 3, x: 10}
foo **tuple # => 7

# Yield
# example 1:
def surround
  puts '{'
  yield  # here the block { puts "hello world" } is executed
  puts '}'
end

surround { puts "hello world" }

# {
# hello world
# }

# example 2:
def twice
  yield
  yield
end

twice do
  puts "Hello!"
end

# "Hello!"
# "Hello!"

# example 3:
def times(n)
  while n > 0
    yield
    n -= 1
  end
end

times(10) do
  puts "Hello"
end

# example 4:
def twice(&block)
  yield
  yield
end

# all calls result in printing "Hello!" on 2 consecutive lines:
twice() do
  puts "Hello!"
end

twice do
  puts "Hello!"
end

twice { puts "Hello!" }

# instead of yield, you can also use block.call
def twice(&block)
  block.call
  block.call
end
twice { puts "Hello!" }

# Yield arguments
# example 1:
def guests
  yield "John"
  yield "Mike"
end

guests do |g|
  puts "Got #{g}"
end
# "Got John"
# "Got Mike"
# same:
guests { |g| puts "Got #{g}" }

# example 2: many arguments
def many
  yield 1, 2, 3
end

many do |x, y, z|
  puts x + y + z
end
# => 6

# block can specify less than the number of arguments yielded:
many do |x, y|
  puts x + y
end
# => 3

# Error specifying more block arguments than those yielded:
# too many block arguments (given 1, expected macimum 0)
# def guests
#   yield
#   yield
# end

# guests do |g|
#   puts "Got #{g}"
# end

# Calling a method with a block
# Short one-argument syntax
method do |argument|
  argument.some_method
end

# can be written as:
method &.some_method
method(&.some_method)
# passing arguments:
method &.some_method(arg1, arg2)
# invoking operators:
method &.+(2)
method &.[index]

# examples:
p [1, 2, 3].map { |n| n.to_s }  # => ["1", "2", "3"]
p [1, 2, 3].map &.to_s # => ["1", "2", "3"]

p [10, 20, 30].map { |n| n.modulo(3) }  # => [1, 2, 0]
p [10, 20, 30].map &.modulo(3) #=> [1, 2, 0]

p [1, 20, 300].map &.to_s.size #=> 1, 2, 3
p [[1, -2], [-3, -4]].map(&.map(&.abs)) #=> [[1, 2], [3, 4]]
p [1, 2, 3, 4].map &.**(2) #=> [1, 4, 9, 16]
p [10, 20, 30].map &.**(3) # => [1000, 8000, 27000]
p (1..5).map(&.+(2)) #=> [3, 4, 5, 6, 7] : Array(Int32)

a = %w[apple bat cat]
a.map(&.upcase)       # => ["APPLE", "BAT" "CAT"]
a.map(&.reverse.upcase) # => ["ELPPA", "TAB" "TAC"]
a.map( &.split(//).sort.join ) # => ["aelpp", "abt" "act"]

my_array = ["123", "22", "1"]
sorted = my_array.sort_by &.size
puts sorted
=> ["1", "22", "123"]

# Break expression inside a block 
def thrice
  puts "Before 1"
  yield 1
  puts "Before 2"
  yield 2
  puts "Before 3"
  yield 3
  puts "After 3"
end

thrice do |i|
  if i == 2
    break
  end
end
# => "Before 1" 
# => "Before 2"

# Next expression inside a block
def twice
  yield 1
  yield 2
end

twice do |i|
  if i == 1
    puts "Skipping 1"
    next
  end

  puts "Got #{i}"
end

# =>
# Skipping 1
# Got 2

# with ... yield
# https://crystal-lang.org/docs/syntax_and_semantics/blocks_and_procs.html

# Short syntax form for exception handling
def some_method
  something_dangerous
rescue
  # execute if an exception is raised
end

# The above is the same as:
def some_method
  begin
    something_dangerous
  rescue
    # execute if an exception is raised
  end
end

def some_method
  something_dangerous
ensure
  # always execute this
end

# The above is the same as:
def some_method
  begin
    something_dangerous
  ensure
    # always execute this
  end
end

# Chaining methods
p (1..5).to_a
        .sort { |a,b| a<=>b }
        .reject { |a| a.even? }
# [1, 3, 5]