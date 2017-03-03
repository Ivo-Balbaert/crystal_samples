arr = [] of String
puts "Give the words one by one and enter, and end with an empty line"
while in = gets
  #  puts "in: #{in}"
  if in == ""
    break
  end
  arr << in
end

puts arr.sort!
