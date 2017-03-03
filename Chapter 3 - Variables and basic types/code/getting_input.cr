# p "Hello there, and what's your name?"
# name = gets
# p "Please to meet you " + name + "!"
#                         ^
# Error: no overload matches 'String#+' with type (String | Nil)
# Overloads are:
#  - String#+(other : self)
#  - String#+(char : Char)
# Couldn't find overloads for these types:
#  - String#+(Nil)
# Rerun with --error-trace to show a complete error trace.

# This works:
p "Hello there, and what's your name?"
if name = gets
  p "Please to meet you " + name + "!"
end
