# Not working (Mar 6 2017)
require "./crystal-postgresql/*"
require "pg"

# PG.connect_listen("postgres:///", "a", "b") do |n| # connect and  listen on "a" and "b"
#   puts "    got: #{n.payload} on #{n.channel}"     # print notifications as they come in
# end

PG_DB = DB.open("postgres://localhost:5432/")         # make a normal connection
spawn do                                              # spawn a coroutine
  10.times do |i|                                     #
    chan = rand > 0.5 ? "a" : "b"                     # pick a channel
    puts "sending: #{i}"                              # prints always before "got:"
    PG_DB.exec("SELECT pg_notify($1, $2)", [chan, i]) # send notification
    puts "   sent: #{i}"                              # may print before or after "got:"
    sleep 1
  end
end

sleep 6 #                                          # wait a bit before exiting

# => (DB::ConnectionRefused)
