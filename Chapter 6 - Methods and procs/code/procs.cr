# Procs represent a function pointer with an optional context (the closure data)
# It is typically created with a proc literal

# A proc without arguments
proc = ->{ 1 } # Proc(Int32)

f = ->{ 1 + 2 }
puts f.call #=> 3

# A proc with one argument
proc = ->(x : Int32) { x.to_s }
p proc.class # Proc(Int32, String)

# Or using the new method
Proc(Int32, String).new { |x| x.to_s }

# Invoke proc with call method
p proc.call 10 #=> "10"

# A proc with two arguments:
proc = ->(x : Int32, y : Int32) { x + y } # Proc(Int32, Int32, Int32)
p proc.call(1, 2) #=> 3

# A proc created from a method (also a class instance method)   :
# example 1
def plus_one(x)
  x + 1
end

proc = ->plus_one(Int32)
proc.call(41) #=> 42

# example 2
def add(x, y)
  x + y
end

adder = ->add(Int32, Int32)
adder.call(1, 2) #=> 3

# example 3
str = "hello"
proc = ->str.count(Char)
proc.call('e') #=> 1
proc.call('l') #=> 2

# Types
Proc(Int32, String) # A Proc accepting a single Int32 argument and returning a String
Proc(Void) # A proc accepting no arguments and returning Void
Proc(Int32, String, Char) #  A proc accepting two arguments (one Int32 and one String) and returning a Char
Array(Int32, String -> Char) # An array of Proc(Int32, String, Char)

# try method
