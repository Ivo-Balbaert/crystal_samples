# if some_condition
#   do_something
# elsif some_other_condition
#   do_something_else
# else
#   do_that
# end
# no elsif example

a = 1
if a > 0
  a = 10
end
p a #=> 10

b = 1
if b > 2
  b = 10
else
  b = 20
end
p b #=> 20

# If as a suffix
cond = true
puts "if as a suffix" if true
a = 2 if cond

# Ternary if
p a = 1 > 2 ? 3 : 4 #=> 4
# The above is the same as:
a = if 1 > 2
      3
    else
      4
    end

p value = rand < 0.5 ? -3 : nil  # value is either 0.5 or nil

# Return type = union
a = 1
if some_condition
  a = "hello"
else
  a = true
end
# a : String | Bool

b = 1
if some_condition
  b = "hello"
end
# b : Int32 | String

if some_condition
  c = 1
else
  c = "hello"
end
# c : Int32 | String

if some_condition
  d = 1
end
# d : Int32 | Nil

a = some_condition ? nil : 3
# a is Int32 or Nil

a = 1
if some_condition
  a = "hello"
  # a : String
  a.size
end
# a : String | Int32

if some_condition
  e = 1
else
  e = "hello"
  # e : String 
  return # type is not considered
end
# e : Int32

# If as an expression
a = if 2 > 1
      3
    else
      4
    end

p a #=> 3

# branches that are not present return nil
if 1 > 2
  3
end
    # The above is the same as:
if 1 > 2
  3
else
  nil
end

    # Another example:
if 1 > 2
else
  3
end
# The above is the same as:
if 1 > 2
  nil
else
  3
end

# If var
# a is Int32 or Nil
if a
  # Since the only way to get here is if a is truthy,
  # a can't be nil. So here a is Int32.
  a.abs
end
# also when assigned:
if a = some_expression
  # here a is not nil
end
# also with &&
if a && b
  # here both a and b are guaranteed not to be Nil
end
# doesn’t work with instance variables or class variables:
if @a
  # here @a can be nil
end
# To do something with @a only when it is not nil you have two options:
# First option: assign it to a variable
if a = @a
  # here a can't be nil
end
# Second option: use `Object#try` found in the standard library
@a.try do |a|
  # here a can't be nil
end
# The techniques described above for instance variables will also work for proc and method calls.

# If var.is_a?(type)
if a.is_a?(String)
  # here a is a String
end

if b.is_a?(Number)
  # here b is a Number
end

a = some_condition ? 1 : "hello"
# a : Int32 | String

if a.is_a?(Number)
  # a : Int32
else
  # a : String
end

if a.is_a?(String) && b.is_a?(Number)
  # here a is a String and b is a Number
end

# doesn’t work with instance variables or class variables
if @a.is_a?(String)
  # here @a is not guaranteed to be a String
end

a = @a
if a.is_a?(String)
  # here a is guaranteed to be a String
end
# a bit shorter:
if (a = @a).is_a?(String)
  # here a is guaranteed to be a String
end

# If var.responds_to?(...)
if a.responds_to?(:abs)
  # here a's type will be reduced to those responding to the 'abs' method
end
a = some_condition ? 1 : "hello"
# a : Int32 | String

if a.responds_to?(:abs)
  # here a will be Int32, since Int32#abs exists but String#abs doesn't
else
  # here a will be String
end
# doesn’t work with instance variables or class variables
if @a.responds_to?(:abs)
  # here @a is not guaranteed to respond to `abs`
end

a = @a
if a.responds_to?(:abs)
  # here a is guaranteed to respond to `abs`
end
# a bit shorter:
if (a = @a).responds_to?(:abs)
  # here a is guaranteed to respond to `abs`
end

# If var.nil?
a = some_condition ? nil : 3
if a.nil?
  # here a is Nil
else
  # here a is Int32
end

# If !
a = some_condition ? nil : 3
if !a
  # here a is Nil because a is falsey in this branch
else
  # here a is Int32, because a is truthy in this branch
end

b = some_condition ? 1 : "x"
if !b.is_a?(Int32)
  # here b is String because it's not an Int32
end