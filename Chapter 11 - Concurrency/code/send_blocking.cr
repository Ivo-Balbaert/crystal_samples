# example 1
ch = Channel(String).new
ch.send "Hello?" # This blocks the program execution
puts ch.receive

# example 2
ch = Channel(Int32).new

spawn do
    n = ch.receive  # fiber will block here if nothing on the channel yet
    puts "fiber received #{n}"
end

ch.send 42
puts "main has send 42"