# Spawning a fiber
spawn do
  HTTP::Client.get "http://curry-on.org/"
end

spawn do
  # ...
  socket.gets
  # ...
end

spawn do
  # ...
  sleep 5.seconds
  #  ...
end

# main fiber sleeps 1 second, so other fiber can do something:
spawn do
  loop do
    puts "Hello!"
  end
end
puts "main ends"

sleep 1.second # or:  Fiber.yield - program does not stop!

# Spawning a call
# problem: shared variable
i = 0
while i < 10
  spawn do
    puts(i)
  end
  i += 1
end

Fiber.yield
# Output: 10 on 10 consecutive lines!

# solution:
i = 0
while i < 10
  proc = ->(x : Int32) do
    spawn do
      puts(x)
    end
  end
  proc.call(i)
  i += 1
end

Fiber.yield
# Output: 0 to 9 on 10 consecutive lines

# shorter with spawn macro:
i = 0
while i < 10
  spawn puts(i)
  i += 1
end

Fiber.yield

# not necessary with block arguments
10.times do |i|
  spawn do
    puts i
  end
end

Fiber.yield

# Spawning a fiber and waiting for it to complete
# example 1:
channel = Channel(Nil).new

spawn do
  puts "Before send"
  channel.send(nil)
  puts "After send"
end

puts "Before receive"
channel.receive
puts "After receive"
# Output:
# Before receive
# Before send
# After receive

# example 2:
channel = Channel(Int32).new

spawn do
  puts "Before first send"
  channel.send(1)
  puts "Before second send"
  channel.send(2)
end

puts "Before first receive"
value = channel.receive
puts value # => 1

puts "Before second receive"
value = channel.receive
puts value # => 2
# Output
# Before first receive
# Before first send
# 1
# Before second receive
# Before second send
# 2

# example 3: waiting for I/O
require "socket"
channel = Channel(String).new

spawn do
  server = TCPServer.new("0.0.0.0", 8080)
  socket = server.accept
  while line = socket.gets
    channel.send(line)
  end
end

spawn do
  while line = gets
    channel.send(line)
  end
end

3.times do
  puts channel.receive
end

# example 4: wait for multiple fibers to complete execution, and gather their values
channel = Channel(Int32).new

10.times do |i|
  spawn do
    channel.send(i * 2)
  end
end

sum = 0
10.times do
  sum += channel.receive
end
puts sum # => 90

# use receive inside a spawned fiber:
channel = Channel(Int32).new

spawn do
  puts "Before send"
  channel.send(1)
  puts "After send"
end

spawn do
  puts "Before receive"
  puts channel.receive
  puts "After receive"
end

puts "Before yield"
Fiber.yield
puts "After yield"

# Output:
Output:
# Before yield
# Before send
# Before receive
# 1
# After receive
# After send
# After yield

# Buffered channels
# The above examples use unbuffered channels: when sending a value, if a fiber is 
# waiting on that channel then execution continues on that fiber.
# With a buffered channel, invoking send won't switch to another fiber unless 
# the buffer is full:
# A buffered channel of capacity 2
channel = Channel(Int32).new(2)

spawn do
  puts "Before send 1"
  channel.send(1)
  puts "Before send 2"
  channel.send(2)
  puts "Before send 3"
  channel.send(3)
  puts "After send"
end

3.times do |i|
  puts channel.receive
end

# Output:
# Before send 1
# Before send 2
# Before send 3
# 1
# 2
# After send
# 3