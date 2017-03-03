# begin end
n = begin
    a = 3
    a += 1
    a
end
p n # => 4

# see simple_loops.cr:
3.times do
  p "Hi"
end

3.times { p "Hi" }

(1..3).each do |index|
  puts "Index: #{index}"
end