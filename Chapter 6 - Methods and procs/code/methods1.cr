# Methods on everything:
1.to_s #=> "1"
["cats", "dogs"].join(" ") #=> "cats dogs": String

# Built-in methods:
puts "Hi"  # => Hi
ret = puts "Hi" # => Hi
puts ret # => blank
p ret #=> nil

p "Hi"  # => "Hi"
ret = p "Hi" # => "Hi"
puts ret # => Hi
p ret #=> "Hi"

# Defining and using methods
# Without arguments
def bark
  puts "waf"
end

bark    #=> waf
bark    #=> waf

# One argument
def bark(n)
  puts "waf" * n
end

bark 3 => # wafwafwaf
# bark "Hi" # no overload matches 'String#*' with type String
# bark # wrong number of arguments for 'bark' (given 0, expected 1)

# Duck typing:
# the double method can be used for every object x whose Type has a * method 
def double(x)
  x * 2
end

p double(2) #=> 4
p double 3 #=> 6
p double double 3 #=> 12
p double("Hi") #=> "HiHi" 

# using a local variable
def doublel(x)
  tmp = x * 2
  tmp
end
# p tmp  # => undefined local variable or method 'tmp'

# Variables declared in a program are not visible inside methods
x = 1
def add(y)
#  x + y # Error: undefined local variable or method 'x'
end
add(2)

# Arguments
def sum(x, y)
  x + y
end

p sum 3, 4 #=> 7
p sum sum(3, 4), 5 #=> 12

def greet(name, age)
  "I'm #{name}, #{age} old."
end

p greet "Serdar", 27 # => # "I'm Serdar, 27 old."

# Default values
# Example 1:
def greet(name = "Ivo", age = 61)
  "I'm #{name}, #{age} old."
end
p greet              # => # "I'm Ivo, 61 old."
p greet "Serdar", 27 # => # "I'm Serdar, 27 old."

# Example 2:
def show(x = 1, y = 2, z = 3)
  "x: #{x}, y: #{y}, z: #{z}"
end

show              # => "x: 1, y: 2, z: 3"
show 10           # => "x: 10, y: 2, z: 3"
show 10, 20       # => "x: 10, y: 20, z: 3"
show 10, 20, 30   # => "x: 10, y: 20, z: 30"

# Named arguments
p greet name: "Christiane", age: 60

show y: 20              # => "x: 1, y: 20, z: 3"
show x: 10, z: 30       # => "x: 10, y: 2, z: 30"
show z: 4, y: 3, x: 2   # => "x: 2, y: 3, z: 4"

# important when complex names (name safety)
require "oauth2"

client = OAuth2::Client.new(
  host: "some_host",
  client_id:  "some_client_id",
  client_secret:  "some_client_secret"
)

def some_method(x, y = 1, z = 2, w = 3)
  # do something...
end

some_method 10                   # x: 10, y: 1, z: 2, w: 3
some_method 10, z: 10            # x: 10, y: 1, z: 10, w: 3
some_method 10, w: 1, y: 2, z: 3 # x: 10, y: 2, z: 3, w: 1
some_method y: 10, x: 20         # x: 20, y: 10, z: 2, w: 3
some_method y: 10                # Error, missing argument: x

# Return value - type
def even?(num)
  if num % 2 == 0
    return true
  end

  return false
end
# shorter:
def even?(num)
    num % 2 == 0
end

# Multiple return values
def double_and_string(x)
  {x * 2, x.to_s}
end

ret = double_and_string(10) # => {20, "10"}
ret[0]   # => 20
ret[1]   # => "10"

# unpacking, destructuring:
double, string = double_and_string(10) # => {20, "10"}
double   # => 20
string   # => "10"

# Specifying return type
def some_method : String
  "hello"
end

def some_method : Nil   
  1 + 2
end

some_method # => nil  

# Naming conventions:
# all methods that return booleans end with a question mark
5.even? # false
5.odd?  # true

# if a method ends with an exclamation mark, it does something destructive
# like mutate the receiver. Some methods have a ! version to make a change, and
# a non-! version to just return a new changed version
company_name = "Dunder Mifflin"
p company_name.gsub "Dunder", "Donald"  #=> "Donald Mifflin"
p company_name  #=> "Dunder Mifflin"    
p company_name.gsub! "Dunder", "Donald"
p company_name  #=> "Donald Mifflin"

# Overloading with named arguments to produce expressive APIs:
# * means: everything that follows has to be passed by name
def show(x, *, enclosed_by)
  "#{enclosed_by}#{x}#{enclosed_by}"
end

def show(x, *, prefixed_with)
  "#{prefixed_with}#{x}"
end

show 1, enclosed_by "~~"    # => "~~1~~"
show 1, prefixed_with "~~"  # =>  "~~1"

# Give arguments external and internal names  (like in Swift or Objectçve C)
def show(x, *, enclosed_by delimiter)
  "#{delimiter}#{x}#{delimiter}"
end

def show(x, *, prefixed_with prefix)
  "#{prefix}#{x}"
end

show 1, enclosed_by "~~"    # => "~~1~~"
show 1, prefixed_with "~~"  # =>  "~~1"