def prime?(n)
  (2...n).all? { |i| n % i != 0 }
end

puts prime?(71) # true
puts prime?(3)  # true
