def fact(n)
    if n > 0
        n * fact(n - 1)
    else
        1
    end
end

p fact(5)  # => 