class Person
  private def say(message)
    puts message
  end

  def say_hello
    say "hello" # OK, no receiver
#    self.say "hello" # Error, self is a receiver

    other = Person.new "Other"
#    other.say "hello" # Error, other is a receiver
  end
end

# Private methods are visible by subclasses
class Employee < Person
  def say_bye
    say "bye" # OK
  end
end

# Protected
### Example 1
class Person
  protected def say(message)
    puts message
  end

  def say_hello
    say "hello" # OK, implicit self is a Person
    self.say "hello" # OK, self is a Person

    other = Person.new "Other"
    other.say "hello" # OK, other is a Person
  end
end

class Animal
  def make_a_person_talk
    person = Person.new
#    person.say "hello" # Error, person is a Person
                       # but current type is an Animal
  end
end

one_more = Person.new "One more"
# one_more.say "hello" # Error, one_more is a Person
                     # but current type is the Program

### Example 2
module Namespace
  class Foo
    protected def foo
      puts "Hello"
    end
  end

  class Bar
    def bar
      # Works, because Foo and Bar are under same Namespace
      Foo.new.foo
    end
  end
end

Namespace::Bar.new.bar

# Protected class method
class Person
  protected def self.say(message)
    puts message
  end

  def say_hello
    Person.say "hello" # OK
  end
end

# Private top-level method
# In file one.cr
private def greet
  puts "Hello"
end

greet #=> "Hello"

# In file two.cr
require "./one"

greet # undefined local variable or method 'greet'

# Private top-level method class
# In file one.cr
private class Greeter
  def self.greet
    "Hello"
  end
end

Greeter.greet #=> "Hello"

# In file two.cr
require "./one"

Greeter.greet # undefined constant 'Greeter'