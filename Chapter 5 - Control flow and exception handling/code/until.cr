until some_condition
  do_this
end

# The above is the same as:
while !some_condition
  do_this
end

index = 0
until index > 3
  puts "Index: #{index}"
  index += 1
end
# Index: 0
# Index: 1
# Index: 2
# Index: 3

# break and next also work
