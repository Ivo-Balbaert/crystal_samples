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

# Example 5: Buffered channels
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

# # Example 6: Synchronization of channels:
# background worker signals on channel when it is done
# main fiber only continues when that signal is received
def worker(done : Channel(Bool))
  puts "worker: working"
  sleep 2
  puts "worker: done"
  done.send true
end

done = Channel(Bool).new
spawn worker(done)

done.receive   # main blocks here
puts "main: next"

# worker: working
# worker: done
# main: next

