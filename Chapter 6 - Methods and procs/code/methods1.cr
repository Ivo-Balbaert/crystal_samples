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

def double(x)
  x * 2
end

p double(2) #=> 4
p double 3 #=> 6
p double double 3 #=> 12

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
def greet(name = "Ivo", age = 61)
  "I'm #{name}, #{age} old."
end
p greet              # => # "I'm Ivo, 61 old."
p greet "Serdar", 27 # => # "I'm Serdar, 27 old."

# Named arguments
p greet name: "Christiane", age: 60

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
