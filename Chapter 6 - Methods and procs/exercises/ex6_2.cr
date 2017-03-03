def add(x : Number, y : Bool)
    y ? x : 0
end

p add 5, true       # => 5
p add 13, false     # => 0