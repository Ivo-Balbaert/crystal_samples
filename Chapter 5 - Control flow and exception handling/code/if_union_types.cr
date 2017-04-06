if rand < 0.5
    x = 1
else
    x = "hello"
end

result = x * 2  # => type is (Int32 | String)
# x - 1 # => Error: undefined method '-' for String

