chan = Channel(String).new
100000.times do
  spawn do
    chan.send "Hello world!"
  end
  puts chan.receive
end

# Output:
# Hello world!
# Hello world!
# Hello world!
# Hello world!
# Hello world!
# ...
