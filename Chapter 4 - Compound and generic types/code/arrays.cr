# Literal values
p [1, 2, 3].class         #=> Array(Int32)
p [1, "hello", 'x'].class #=> Array(Int32 | String | Char)
languages = ["English", "Norwegian", "Ruby"]

# Empty arrays should specify a type
# []               # Syntax error: for empty arrays use '[] of ElementType'
[] of Int32      #=> [] : Array(Int32)
Array(Int32).new #=> [] : Array(Int32)
genders = [] of String

# Add to an array
array << 6  #=> [1, 2, 3, 4, 5, 6]

# Initialize an array with 6 elements equal to 0
b = Array(Int32).new(6, 0)
b[3] = 100
puts b # => [0, 0, 0, 100, 0, 0]

# Array of String: Array(String)
p %w(one two three) # => ["one", "two", "three"]

# Array of Symbol: Array(Symbol)
p %i(one two three) # => [:one, :two, :three]

# Indexing:
array = [1, 2, 3, 4, 5] #=> [1, 2, 3, 4, 5] : Array(Int32)
p array[0]                #=> 1               : Int32
# array[10]               # raises IndexError
# array[-6]               # raises IndexError
p array[10]?              #=> nil             : (Int32 | Nil)
p array[-6]?              #=> nil             : (Int32 | Nil)
# From the end
p array[-1] #=> 5
# With a start index and size
p array[2, 3] #=> [3, 4, 5]
# Or with range
p array[1..3] #=> [2, 3, 4]

# Methods:
p languages.size       # 3
p languages.to_s       # "[\"English\", \"Norwegian\", \"Ruby\"]"
p languages.join(" ,") # "English ,Norwegian ,Ruby"

# Remove from the end of the array
array.pop #=> 6
p array     #=> [1, 2, 3, 4, 5]

# Remove from the beginning of the array
array.shift #=> 1
p array       #=> [2, 3, 4, 5]

# Check if an item exists in an array
p array.includes? 3 #=> true

# Nested arrays
nest = [1, ["b", [:c, ['d']]]]

# Array-like types
MyArrayType{1, 2, 3}
MyArrayType(Int32 | String) {1, 2, "foo"}

# Union types:
desired_things = [:unicorns, "butterflies", 1_000_000]
p typeof(desired_things.first) # typeof returns (Int32 | String | Symbol)
p desired_things.first.class   # the class method returns the runtime type, here Symbol
p desired_things.class # => Array(Char | Int32 | Symbol)