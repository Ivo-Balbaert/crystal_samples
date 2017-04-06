require "http/server"
 
server = HTTP::Server.new(3000) do |context|
  context.response.content_type = "text/xml" 
  time = Time.now
  message = if time.hour < 12
              "Good morning"
            elsif time.hour < 18
              "Good afternoon"
            else
              "Good night"
            end
  context.response.print "<Response><Say>#{message} from Crystal!</Say></Response>"
end

puts "Listening on http://0.0.0.0:3000"
server.listen