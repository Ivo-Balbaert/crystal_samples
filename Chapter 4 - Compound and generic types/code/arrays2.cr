# Iterators: each
languages = ["English", "Norwegian", "Ruby"]
languages.each do |lang|
  puts "I love " + lang + "!"
end
# I love English!
# I love Norwegian!
# I love Ruby!

# same: do becomes { and end becomes }
languages.each {|lang|  puts "I love " + lang + "!"}

# Unpacking block arguments
array = [{1, "one"}, {2, "two"}]
array.each do |(number, word)|
  puts "#{number}: #{word}"
end
# => 1: "one"
# => 2: "two"

# sort:
p languages.sort
p languages     # original array is not sorted
p languages.sort!
p languages     # original array is changed
puts [7,3,2,8].sort #=> [2, 3, 7, 8]

# Enumerable#map and Enumerable#select:
arr = [1, 2, 3]
p arr.map { |x| x + 1 }         #=> [2, 3, 4]
p arr.select { |x| x % 2 == 1 } #=> [1, 3]

# []? method and union types
a = [1, 2, 3]
value = a[4]? #=> return a value of type Int32 | Nil
if value
  puts "The number at index 4 is : #{value}"
else
  puts "No number at index 4"
end

# Chaining methods:
(1..5).to_a
.sort {|a, b| b<=>a}
.reject {|a| a.even?}  # => [5, 3, 1]