p [1, 2, 3, 4].any? {|num| num > 10}  # => false

# chaining:
p [1, 2, 3, 4].map {|num| num * num}.any? {|num| num > 10} # => true