class Singer
  getter band : String, first_name : String, last_name : String | Nil

  def initialize(@band, @first_name, @last_name)
  end
end

def lead_singer_for(band, singers)
  singers.find { |s| s.band == band }
end

def longest_last_name(singers)
  # singers.map { |s| s.last_name }.max_by { |name| name.size }
  singers_with_last_names = singers.map { |s| s.last_name }.compact
  unless singers_with_last_names.empty?
    singers_with_last_names.max_by { |name| name.size }
  end
end

lead_singers = [
  Singer.new("The Rolling Stones", "Mick", "Jagger"),
  Singer.new("Queen", "Freddie", "Mercury"),
  Singer.new("The Doors", "Jim", "Morrison"),
  Singer.new("The Police", "Sting", nil),
]

singer = lead_singer_for("The Doors", lead_singers)
if singer
  puts "#{singer.first_name} #{singer.last_name}"
else
  puts "No singer found!"
end
# => Jim Morrison

puts longest_last_name(lead_singers)
# => Morrison

# Jim Morrison
# Morrison
