tpl = {1, "hello", 'x'}
p tpl.class #=> Tuple(Int32, String, Char)
tuple[0]                  #=> 1       (Int32)
tuple[1]                  #=> "hello" (String)
tuple[2]                  #=> 'x'     (Char)

# Empty tuple
empty = Tuple.new

# Acces tuple's value by its index
tuple = {:key1, :key2}
tuple[1] #=> :key2
# tuple[2] #=> syntax error : Index out of bound

# Can be expanded (decomposed) into multiple variables
a, b, c = {:a, 'b', "c"}
a #=> :a
b #=> 'b'
c #=> "c"

# Returning multiple values from a method
def name_and_age
  {"John", 45}
end

name, age = name_and_age
puts name.size #=> 4
puts age    #=> 45

# Denoting a tuple's type:
Tuple(Int32, String, Char) # The type denoting a tuple of Int32, String and Char
# shorter syntax:
{Int32, String, Char}
# example:
Array({Int32, String, Char}) # An array of tuples of Int32, String and Char

# Tuples have methods (include Enumerable module)
nums = {1, 2, 3.5}
puts nums.size #=> 3
nums.each do |value|
  puts value
end

# Named tuple
tuple = {name: "Crystal", year: 2011} # NamedTuple(name: String, year: Int32)
tuple[:name] # => "Crystal" (String)
tuple[:year] # => 2011      (Int32)

# Shorter syntax
# An array of named tuples of x: Int32, y: String
Array({x: Int32, y: String})

# named tuple key can also be a string:
{"this is a key": 1}