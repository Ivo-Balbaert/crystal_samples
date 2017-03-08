def fact(n)
    if n == 0
        return 1
    end
    return n * fact(n - 1)
end

p fact(5)  # => 120

# typed:
def fact(n : Int) : Int
    if n < 0 
        raise ("n cannot be negative!")
    end
    if n == 0
        return 1
    end
    return n * fact(n - 1)
end