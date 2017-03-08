str = "Crystal"
puts str      # => Crystal
print str     # => Crystal (without newline!, so next line is appended to it)
p str         # => "Crystal"
pp str        # => str # => "Crystal"
p str.inspect # => "\"Crystal\""

arr = [1, 3, 7]
puts arr      # => [1, 3, 7]
print arr     # => [1, 3, 7]
p arr         # => [1, 3, 7]
pp arr        # => arr # => [1, 3, 7]
p arr.inspect # => "[1, 3, 7]"
