# Loops
index = 0
while index <= 3
  puts "Index: #{index}"
  index += 1
end
# Index: 0
# Index: 1
# Index: 2
# Index: 3

# Type of variable after a while
a = 1
while some_condition
  a = "hello"
  # a : String
  a.size
end
# a : Int32 | String

# Checking the condition at the end of a loop
while true
  do_something
  break if some_condition
end

# Break out of a while loop
a = 2
while (a += 1) < 20
  if a == 10
    # goes to 'puts a'
    break
  end
end
puts a #=> 10

# Try to execute the next iteration of a while loop
a = 1
while a < 5
  a += 1
  if a == 3
    next
  end
  puts a
end
# The above prints the numbers 2, 4 and 5

# using a begin / end and a while to assign to a constant
TEN = begin
  a = 0
  while a < 10
    a += 1
  end
  a
end
p TEN #=> 10

