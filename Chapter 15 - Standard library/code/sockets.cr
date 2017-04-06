require "socket"

ch = Channel(TCPSocket).new

10.times do
  spawn do
    loop do
      socket = ch.receive
      socket.puts "Hi!"
      socket.close
    end
  end
end

server = TCPServer.new(1234)
loop do
  socket = server.accept
  p socket
  ch.send socket
end
