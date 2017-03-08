# p "Hello there, and what's your name?"
name = gets   # or gets()
puts "I like your name #{name}!"  # if name == nil , #{name} doesn't show anything

# p "Please to meet you " + name + "!"
#                         ^
# Error: no overload matches 'String#+' with type (String | Nil)
# Overloads are:
#  - String#+(other : self)
#  - String#+(char : Char)
# Couldn't find overloads for these types:
#  - String#+(Nil)

# This works:
p "Hello there, and what's your name?"
if name = gets
  p "Please to meet you " + name + "!"
  puts "Length of your name: #{name.size}"
  puts "Bytesize of your name: #{name.bytesize}"
end

# öivo
# Length: 4
# Bytesize: 5