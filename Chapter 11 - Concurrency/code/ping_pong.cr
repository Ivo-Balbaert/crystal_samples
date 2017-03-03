def ping(pings, message)
  pings.send message
end

def pong(pings, pongs)
  message = pings.receive
  pongs.send message
end

pings = Channel(String).new
pongs = Channel(String).new
spawn ping pings, "passed message"  # Fiber1 sends on pings channel
spawn pong pings, pongs             # Fiber2 receives on ping channel, sends on pong channel
puts pongs.receive # => passed message # main receives on pong channel
