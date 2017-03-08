str = "Hello Crystal world!"
puts str # => Hello Crystal world!
puts str # => Hello Crystal world!
puts str # => Hello Crystal world!

# puts 'Hello Crystal world!'  # => Syntax error: unterminated char literal,
# => use double quotes for string

p typeof(1)  # => Int32

str = "It's a beautiful day"
puts str # => It's a beautiful day
p typeof(str)  # => String

str = 42
puts str # => 42
p typeof(str)  # => Int32

# puts a # => Error: undefined local variable or method 'a'
a : String
# puts a # => read before assignment to local variable 'a'
a = "Hi there"
# can be combined: a : String = "Hi there"
puts a # => Hi there
# a = 3  # => Error: type must be String, not (Int32 | String)

# puts 42 + "Crystal" # => no overload matches 'Int32#+' with type String

# puts sTr # => Error: undefined local variable or method 'sTr'
sTr = "A new variable!"
puts sTr # => A new variable!

# 3str = "3" # unexpected token: str - variable name is not correct
your_name = "David"
# your-name = "Alicia" #=> unexpected token: =
# 76trombones = "big parade" #=> unexpected token: trombones
# more@ = 1000000 #=> unknown token: ' '
# class = "Advanced Theoretical Zymurgy" #=> expecting token 'CONST', not '='
