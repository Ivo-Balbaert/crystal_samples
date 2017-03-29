require "http/client"
require "json"

class Chucky
  def get_joke(id : Int32) : String
    response = HTTP::Client.get "http://api.icndb.com/jokes/#{id}"
    JSON.parse(response.body)["value"]["joke"].to_s rescue ""
  end

  def get_jokes(ids : Array(Int32)) : Array(String)
    ids.map do |id|
      get_joke(id)
    end
  end
end

c = Chucky.new
puts c.get_joke(20)

# The Chuck Norris military unit was not used in the game Civilization 4,
# because a single Chuck Norris could defeat the entire combined nations
# of the world in one turn.

# puts c.get_jokes(["20"])
# Error in chucky.cr:24: [1mno overload matches 'Chucky#get_jokes' with type Array(String)

puts c.get_jokes([20])
# ["The Chuck Norris military unit was not used in the game Civilization 4, because a single Chuck Norris could defeat the entire combined nations of the world in one turn."]

puts c.get_jokes([20, 30, 40])
# ["The Chuck Norris military unit was not used in the game Civilization 4, because a single Chuck Norris could defeat the entire combined nations of the world in one turn.", "Someone once tried to tell Chuck Norris that roundhouse kicks aren't the best way to kick someone. This has been recorded by historians as the worst mistake anyone has ever made.", "A handicapped parking sign does not signify that this spot is for handicapped people. It is actually in fact a warning, that the spot belongs to Chuck Norris and that you will be handicapped if you park there."]
