# serving index.html
require "http/server"

port = 8080
host = "127.0.0.1"
mime = "text/html"

server = HTTP::Server.new(host, port, [
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
]) do |context|
  req = context.request

  if req.method == "GET" && req.path == "/public"
    filename = "./public/index.html"
    context.response.content_type = "text/html"
    context.response.content_length = File.size(filename)
    File.open(filename) do |file|
      IO.copy(file, context.response)
    end
    next
  end

  context.response.content_type = mime
end

puts "Listening at #{host}:#{port}"
server.listen