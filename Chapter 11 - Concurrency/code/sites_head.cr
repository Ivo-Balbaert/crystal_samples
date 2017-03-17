require "http/client"

chan = Channel(Hash(String, Int32)).new

sites = %w(
    https://crystal-lang.org
    https://twitter.com/crystallanguage
    https://salt.bountysource.com/teams/crystal-lang
)

sites.each do |site|
  spawn do
    response = HTTP::Client.head(site)
    chan.send({ site => response.status_code })
  end
end

(1..sites.size).map { chan.receive }
#=> [{"https://twitter.com/crystallanguage" => 200}, 
#    {"https://crystal-lang.org" => 200}, 
#    {"https://salt.bountysource.com/teams/crystal-lang" => 200}]