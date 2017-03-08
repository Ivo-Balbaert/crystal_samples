# Ranges
p 2..7  # => 2..7
p 3...5 # => 3...5
p 'a'..'z'  # => the alfabet

r = Range.new(2, 7)
1..10                  #=> Range(Int32, Int32)
Range.new(1, 10).class #=> Range(Int32, Int32)

# Can be inclusive or exclusive
p (3..5).to_a  #=> [3, 4, 5]
p (3...5).to_a #=> [3, 4]

# Check whether range includes the given value or not
p (1..8).includes? 2 #=> true

# Map
puts (1..3).map {|i| i.to_s}  # => ["1","2","3"]