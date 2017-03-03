# Module as a namespace:
module Curses
  class Window
  end
end

Curses::Window.new

# Module as a partial type
module ModuleExample
  def foo
    "foo"
  end
end

# Including and extending modules
class Person
  include ModuleExample
end

class Book
  extend ModuleExample
end

# Person.foo     # => Error: undefined method 'foo' for Person:Class
Person.new.foo # => 'foo'
Book.foo       # => 'foo'
# Book.new.foo   # => Error: undefined method 'foo' for Book

# include example
module ItemsSize
  def size
    items.size
  end
end

class Items
  include ItemsSize

  def items
    [1, 2, 3]
  end
end

items = Items.new
items.size #=> 3

# extend example
module SomeSize
  def size
    3
  end
end

class Items
  extend SomeSize
end

Items.size #=> 3

# Module at the top-level
module SomeModule
  class SomeType
  end

  def some_method
    1
  end
end

include SomeModule

SomeType.new # OK, same as SomeModule::SomeType
some_method  # OK, 1

# Common pattern for modules: extend self
module Base64
  extend self

  def encode64(string)
    # ...
  end

  def decode64(string)
    # ...
  end
end

Base64.encode64 "hello" #=> "aGVsbG8="

# when included
include Base64
encode64 "hello" #=> "aGVsbG8="

# A module cannot be instantiated:
module Moo
end

# Moo.new # Error: undefined method 'new' for Moo:Class