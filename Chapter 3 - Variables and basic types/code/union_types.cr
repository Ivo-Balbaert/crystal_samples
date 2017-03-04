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

p a + 2 # => Error: undefined method '+' for Nil
p a * 2 # => Error: undefined method '*' for Nil
p a.not_nil! + 2  # => 44

# set the compile-time type
a = 0.as(Int32|Nil|String)
p typeof(a) # => Int32 | Nil | String

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