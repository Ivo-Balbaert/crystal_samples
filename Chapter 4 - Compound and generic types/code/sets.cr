# Set literal
p set = Set{1, 2, 3} #=> [1, 2, 3]
p set.class          #=> Set(Int32)

# The above is equivalent to
set = Set(typeof(1, 2, 3)).new
set << 1
set << 2
set << 3