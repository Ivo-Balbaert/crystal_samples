a = [[1, 'a'], [2, 'b']]
a << ['c', 3]
p a                   # => [[1, 'a'], [2, 'b'], ['c', 3]]
p typeof(a)           # => Array(Array(Char | Int32))
p a.first.first + 100 # => 101

b = [{1, 'a'}, {2, 'b'}]
p typeof(b) # => Array(Tuple(Int32, Char))
# Error in test.cr:9: [1mno overload matches 'Array(Tuple(Int32, Char))#<<'
# with type Tuple(Char, Int32)
# b << {'c', 3}
p b.first.first + 100 # => 101
