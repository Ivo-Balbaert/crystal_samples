require "http/client"

channel = Channel(String).new
spawn do
  channel.send(HTTP::Client.get(
  "https://crystal-lang.org/").body)
end

spawn do
  channel.send(HTTP::Client.get(
  "http://ruby.org").body)

end

2.times do
  p channel.receive
end
