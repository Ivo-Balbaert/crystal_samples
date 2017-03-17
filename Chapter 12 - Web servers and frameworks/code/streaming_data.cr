require "http/server"

server = HTTP::Server.new(8080) do |context|
  context.response.content_type = "text/plain"
  10.times do |i|
    context.response.puts i
    context.response.flush
    sleep 1
  end
end

puts "Listening on http://0.0.0.0:8080"
server.listen

# Output in browser
# "Hello world, got /"
