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
