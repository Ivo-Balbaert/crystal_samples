def add(a, b)
  if b == 0
    return nil
  end
  a + b
end

p x = add(1, 2) # => 3
p typeof(x)     # => (Int32 | Nil)
# x + 10  # => undefined method '+' for Nil[33;1m (compile-time type is (Int32 | Nil))

# Solution:
if x.is_a? Int32
  p x + 10 # => 13
end

# x.try do   # Error in add.cr:18: instantiating '(Int32 | Nil)#try()'
#   p x + 10 # => 13
# end
