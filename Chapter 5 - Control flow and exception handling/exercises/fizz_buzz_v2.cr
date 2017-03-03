(1..100).each do |i|
  r = case {i % 3 == 0, i % 5 == 0}
      when {true, true}
        "FizzBuzz"
      when {true, _}
        "Fizz"
      when {_, true}
        "Buzz"
      else
        i
      end

  # {i, r, i % 3, i % 5}
  puts r
end
