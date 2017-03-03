# multiple assignment
str, number = "Crystal rocks!", 42
puts str    # => Crystal rocks!
puts number # => 42

names = "John", "Peter", "Jack" # same as: names = ["John", "Peter", "Jack"]

# swap
n = 41
m = 42
n, m = m, n
puts n
puts m
# => 42
# => 41

# reassigning variables
var1 = 8
var2 = var1
p var1 # => 8
p var2 # => 8
var1 = "eight"
p var1 # => "eight"
p var2 # => 8
