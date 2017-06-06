# Generic class
# example 1: a generic stack class
class Stack(T)
  def initialize
    @values = Array(T).new
  end
end

stack1 = Stack(Int32).new
stack2 = Stack(String).new

# example 2
class MyBox(T)
  def initialize(@value : T)
  end

  def value
    @value
  end
end

int_box = MyBox(Int32).new(1)
int_box.value # => 1 (Int32)
int_box = MyBox.new(42)

string_box = MyBox(String).new("hello")
string_box.value # => "hello" (String)
string_box = MyBox.new("crystal")

another_box = MyBox(String).new(1) # Error, Int32 doesn't match String

# example 3
# first do this example without (T) --> compile error in Crystal, works in Ruby (duck typing)
# solution: @value : Int32   or @value : Int32 | Char ???
# better solution: generic type T
class Foo(T)
  getter :value

  def initialize(@value : T)
  end
end

foo = Foo.new(1)    # T is inferred to be an Int32, and foo is a Foo(Int32)
foo.value.abs       # Ok

foo2 = Foo.new('a') # T is inferred to be a Char, and foo2 is a Foo(Char)
foo2.value.ord            # Ok

# You can also explicitly specify the generic type variable
foo3 = Foo(String).new("hello")

# More than one type argument is allowed:
class MyDictionary(K, V)
end

# Any name can be used for type arguments:
class MyDictionary(KeyType, ValueType)
end

# Type variables can be inferred:
MyBox.new(1)       # : MyBox(Int32)
MyBox.new("hello") # : MyBox(String)

# Structs and modules can be generic too
module Moo(T)
  def t
    T
  end
end

class Foo(U)
  include Moo(U)

  def initialize(@value : U)
  end
end

foo = Foo.new(1)
foo.t # Int32

# Generic classes and structs can be inherited
class Parent(T)
end

class Int32Child < Parent(Int32)
end

class GenericChild(T) < Parent(T)
end
