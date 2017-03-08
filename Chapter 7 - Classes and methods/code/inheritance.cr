# Inheriting constructor
class Person
  def initialize(@name : String)
  end

  def greet
    puts "Hi, I'm #{@name}"
  end
end

class Employee < Person
end

employee = Employee.new "John"
employee.greet # "Hi, I'm John"

# Overriding constructor
class Person
  def initialize(@name : String)
  end
end

class Employee < Person
  def initialize(@name : String, @company_name : String)
  end
end

Employee.new "John", "Acme" # OK
Employee.new "Peter" # Error: wrong number of arguments
                     # for 'Employee:Class#new' (1 for 2)

# Override methods in a derived class
class Person
  def greet(msg)
    puts "Hi, #{msg}"
  end
end

class Employee < Person
  def greet(msg)
    puts "Hello, #{msg}"
  end
end

p = Person.new
p.greet "everyone" # "Hi, everyone"

e = Employee.new
e.greet "everyone" # "Hello, everyone"

# Instead of overriding you can define specialized methods by using type restrictions.
class Person
  def greet(msg)
    puts "Hi, #{msg}"
  end
end

class Employee < Person
  def greet(msg : Int32)
    puts "Hi, this is a number: #{msg}"
  end
end

e = Employee.new
e.greet "everyone" # "Hi, everyone"

e.greet 1 # "Hi, this is a number: 1"

# Invoke a superclass' method using super
class Person
  def greet(msg)
    puts "Hello, #{msg}"
  end
end

class Employee < Person
  def greet(msg)
    super # Same as: super(msg)
    super("another message")
  end
end

# Virtual and abstract types
class Animal
end

class Dog < Animal
  def talk
    "Woof!"
  end
end

class Cat < Animal
  def talk
    "Miau"
  end
end

class Person
  getter pet

  def initialize(@name : String, @pet : Animal)
  end
end

john = Person.new "John", Dog.new
peter = Person.new "Peter", Cat.new

# - class Object
#   |
#   +- class Reference
#      |
#      +- class Person
#             @name : String
#             @pet : Animal+

if some_condition
  pet = Dog.new
else
  pet = Cat.new
end

# pet : Animal+
# john.pet.talk # Error: undefined method 'talk' for Animal
# to solve this:
abstract class Animal    # this is enough to solve the error
  # Makes this animal talk
  abstract def talk      #then every subclass must implement talk!
end

john.pet.talk #=> "Woof!"
# Animal.new # Error: can't instantiate abstract class Animal

# Class inheriting from abstract class
abstract class Geometry
  abstract def area
  abstract def perim
end

class Rect < Geometry
  def initialize(@width, @height)
  end

  def area
    @width * @height
  end

  def perim
    2 * @width + 2 * @height
  end
end

puts Rect.new(3, 6).area


# Finalize
class Foo
  def finalize
    # Invoked when Foo is garbage-collected
    puts "Bye bye from #{self}!"
  end
end

# Prints "Bye bye ...!" for ever
loop do
  Foo.new
end

# Generic classes
# Define a new generic class that subclass another one
class MyArray(T) < Array(T)
end

# Define a non-generic class that subclass an instance of a generic another one
class MyInt32Array < Array(Int32)
end