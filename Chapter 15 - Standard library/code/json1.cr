require "json"

class Person
  JSON.mapping(
    name: String,
    age: Int32
  )
end

person = Person.from_json %({"name": "John", "age": 30})
p person #=> #<Person:0x10220CF20 @name="John", @age=30>

puts true.to_json
puts "askn".to_json
puts 1.to_json
puts 12.14.to_json
puts ["apple", "peach", "pear"].to_json   # => ["apple","peach","pear"]
puts Hash{"apple" => 5, "lettuce" => 7}.to_json  # => {"apple":5,"lettuce":7}

json = %({"page": 1, "fruits": ["apple", "peach"]})
puts JSON.parse json # => {"page" => 1, "fruits" => ["apple", "peach"]}

class Location
  JSON.mapping(
    lat: Float64,
    lng: Float64,
  )
end

class House
  JSON.mapping(
    address:  String,
    location: {type: Location, nilable: true},
    time:     {type: Time, converter: Time::Format.new("%F"), emit_null: true, key: "value"},
  )
end

house = House.from_json(%({"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}, "value": "2014-10-31 23:37:16"}))
p house
#<House:0xb3cf00
# @address="Crystal Road 1234",
# @location=#<Location:0xb43ee0 @lat=12.3, @lng=34.5>,
# @time=2014-10-31 00:00:00>