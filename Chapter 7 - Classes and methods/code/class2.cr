# example 1:
class Dog
  def greet
    "Woof! Woof!"
  end

  def greet(name : String)
    "Woof #{name}!"
  end

  def greet(times : Int32)
    greet * times
  end
end

d = Dog.new
d.greet #=> "Woof! Woof!" : String
d.greet("dear readers!") #=> "Woof dear readers!" : String
d.greet(3) #=> "Woof! Woof!Woof! Woof!Woof! Woof!" : String

# example 2: overloading ==
class Human
  @@species = "H. sapiens"
  property :name   

  def initialize(@name : String)
  end

  def ==(other : self)  # self here is type Human
    other.name == name
  end

  def ==(other)
    false
  end

  def self.say(msg)
    puts msg
  end

  def species
    @@species
  end
end

m = Human.new("Marc")
n = Human.new("Gregory")
o = Human.new("Marc")
nh = NotHuman.new

class NotHuman
end


p m == n    # => false
p m == o    # => true
p m == nh   # => false
p m == 5    # => false  (??? test)
