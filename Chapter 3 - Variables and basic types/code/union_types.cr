# union types
arr = [1, 2, "abc", "d"] # type:  Array(Int32 | String)
arr[0] # type:  Int32 | String
"Hello".index('z') # type:  Int32 | Nil

if 1 + 2 == 3
  a = 42
else
  a = "hello"
end
# a # : Int32 | String

# compile-time type:
p typeof(a) # (Int32 | String)
# run-time type:
p a.class     # Int32

p a * 2  # => 64  (* is defined for both Int32 or String)
p a + 2  # => Error: no overload matches 'String#+'' with type Int32

if 1 + 2 == 3
  a = 42
end
p typeof(a)     # => (Int32 | Nil)
p a.class     # => Int32
p a    # => 42

exp = rand(0..1) == 0 ? 'a' : true
puts typeof(exp) #=> Char | Bool
puts exp.class   #=> Char (or Bool, depending on the chosen random value)

p a + 2 # => Error: undefined method '+' for Nil
p a * 2 # => Error: undefined method '*' for Nil
p a.not_nil! + 2  # => 44

###
def foo(a)
  if a >= 0
    a
  else
    nil
  end
end
foo(rand()) + 1 # => undefined method '+' for Nil (compile-time type is (Float64 | Nil))

# Here Enumerable#find will either return a string or nil, 
# which in Ruby would lead to a RuntimeError when no element was found 
# and we try to call the upcase method on nil. 
# However, the Crystal compiler here uses the union type (String | Nil) for found 
# and will not compile this code since not all types in the union know how 
# to respond to the upcase message. So to actually get this program 
# to compile we need explicitly guard against the nil case 
# as shown in the last line of the example.
found = %w(foo bar).find { "foo" }
p typeof(found) #=> (String | Nil)
p found.upcase # undefined method 'upcase' for Nil (compile-time type is (String | Nil))
p found.upcase if found #=> "FOO" : String

# set the compile-time type
a = 0.as(Int32|Nil|String)
p typeof(a) # => Int32 | Nil | String

# Create a type based on another object’s type:
hash = {1 => 'a', 2 => 'b'}
other_hash = typeof(hash).new #:: Hash(Int32, Char)

# Virtual type = Union of classes and structs under the same hierarchy
class Foo
end

class Bar < Foo
end

class Baz < Foo
end

bar = Bar.new
baz = Baz.new

# Here foo's type will be Bar | Baz,
# but because both Bar and Baz inherit from Foo,
# the resulting type is Foo+
foo = rand < 0.5 ? bar : baz
typeof(foo) # => Foo+

# Union of tuples of the same size
t1 = {1, "hi"}   # Tuple(Int32, String)
t2 = {true, nil} # Tuple(Bool, Nil)

t3 = rand < 0.5 ? t1 : t2
typeof(t3) # Tuple(Int32 | Bool, String | Nil)

# Union of named tuples with the same keys
t1 = {x: 1, y: "hi"}   # Tuple(x: Int32, y: String)
t2 = {y: true, x: nil} # Tuple(y: Bool, x: Nil)

t3 = rand < 0.5 ? t1 : t2
typeof(t3) # NamedTuple(x: Int32 | Nil, y: String | Bool)

def shout(x)
  # Notice that both Int32 and String respond_to `to_s`
  x.to_s.upcase
end

foo = ENV["FOO"]? || 10

typeof(foo) # => (Int32 | String)
typeof(shout(foo)) # => String

numbers = [1, 2] of (String | Int32)
numbers << 3
numbers << "Crystal"
# puts numbers.last.size # compiler error
last_elem = numbers.last
if last_elem.is_a?(String)
  puts last_elem.size # => 7
end

