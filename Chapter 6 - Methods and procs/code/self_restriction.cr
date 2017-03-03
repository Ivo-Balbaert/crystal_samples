# A special type restriction is self
class Person
  def ==(other : self)  # self is Person
    other.name == name
  end

  def ==(other)
    false       # test with "no person" as return value
  end
end

john = Person.new "John"
another_john = Person.new "John"
peter = Person.new "Peter"

john == another_john #=> true
john == peter #=> false (names differ)
john == 1 #=> false (because 1 is not a Person) # "no person"

# self always represents a match against an instance type, even in class methods
class Person
  def self.compare(p1 : self, p2 : self)
    p1.name == p2.name
  end
end

john = Person.new "John"
peter = Person.new "Peter"

Person.compare(john, peter) # OK

