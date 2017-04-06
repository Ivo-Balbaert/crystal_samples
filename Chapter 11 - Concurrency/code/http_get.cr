require "http/client"
ch = Channel(String).new

spawn do
    body = HTTP::Client.get("http://example.com").body
    ch.send(body)
end

spawn do
    body = HTTP::Client.get("https://crystal-lang.org").body
    ch.send(body)
end

ch.receive
ch.receive