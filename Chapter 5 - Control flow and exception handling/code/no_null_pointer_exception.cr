# example 1:
str = "Hello"
idx = str.index('z') # idx is of union type (Int32 | Nil)

str[idx] # => compile error: no overload matches 'String#[]' with types (Int32 | Nil)

# solution:
if idx
    str[idx] # idx :: Int32
end

# or:
if idx.is_a?(Int32)
    str[idx] # idx :: Int32
end

# example 2:
# code that can give a null pointer exception
# because connection can be closed, --> gets returns nil
require "socket"

# Create a new TCPServer at port 8080
server = TCPServer.new(8080)

# Accept a connection
socket = server.accept

# Read a line and output it capitalized
# puts socket.gets.capitalize  # => undefined method 'capitalize' for nil
# compile-time type is (String | Nil)

# Solution:
line = socket.gets
if line
  puts line.capitalize # Crystal knows that line cannot be nil here!
else
  puts "Nothing in the socket"
end

# example 3:
if rand(2) > 0
  my_string = "hello world"
end

# puts my_string.upcase
# Error in hello_world.cr:5: undefined method 'upcase' for Nil (compile-time type is (String | Nil))

# puts my_string.upcase
#                ^~~~~~
# Solution:
if my_string
  puts my_string.upcase
end

# example 4:
x = rand < 0.5 ? 1 : nil
if x
  puts x + 1
else
  puts "no x"
end

# alternative:
x = rand < 0.5 ? 1 : nil
if x.nil?
  puts "no x"
else
  puts x + 1
end

# 2nd alternative:
x = rand < 0.5 ? 1 : nil
if x.is_a?(Number)
  puts x + 1
else
  puts "no x"
end

# 3rd alternative:
x = rand < 0.5 ? 1 : nil
case x
when Number
  puts x + 1
else
  puts "no x"
end