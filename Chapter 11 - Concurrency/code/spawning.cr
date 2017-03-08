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

# Spawn can also start a method:
def pname(name)
  sleep 4
  3.times do |i|
    puts "#{name} - #{i}"
  end
end

pname("normal")     # started by main fiber
spawn pname "spawned" # started on another fiber (in background)


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

