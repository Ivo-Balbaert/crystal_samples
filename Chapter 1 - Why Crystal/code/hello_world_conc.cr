chan = Channel(String).new
5.times do
  spawn {
    chan.send "Hello world!"
  }
  puts chan.receive
end

# Output:
# Hello world!
# Hello world!
# Hello world!
# Hello world!
# Hello world!
