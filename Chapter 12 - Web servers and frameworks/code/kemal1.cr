# has to be in a project that includes kemal as a shard
require "kemal"

# Matches GET "http://host:port/"
get "/" do
  "Hello World!"
end

# Creates a WebSocket handler.
# Matches "ws://host:port/socket"  #ws://localhost:80/socket in browser doesn't work !
ws "/socket" do |socket|
  socket.send "Hello from Kemal!"
end

Kemal.run