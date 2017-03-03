# Int#times
3.times do
  p "Hi"
end

# same as:
3.times { p "Hi" }

# Range#each
(1..3).each do |index|
  puts "Index: #{index}"
end
# Index: 0
# Index: 1
# Index: 2
# Index: 3

# Infinite loop
loop do
  do_something
  break if some_condition
end