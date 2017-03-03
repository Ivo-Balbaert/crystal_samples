# Class definition     
class Person
end

# Define a class with the class keyword
class Human

  # A class variable. It is shared by all instances of this class.
  @@species = "H. sapiens"

  # An instance variable
  @name : String   # can also be created in initialize method

  # Basic initializer
  # Assign the argument to the "name" instance variable for the instance
  # If no age given, we will fall back to the default in the arguments list.
  def initialize(@name, @age = 0)
  end

  # Basic setter method
  def name=(name)
    @name = name
  end

  # Basic getter method
  def name
    @name
  end

  # The above functionality can be encapsulated using the attr_accessor method as follows
  property :name

  # Getter/setter methods can also be created individually like this
  getter :name
  setter :name

  # A class method uses self to distinguish from instance methods.
  # It can only be called on the class, not an instance.
  def self.say(msg)
    puts msg
  end

  def species
    @@species
  end
end


# Instantiate a class
jim = Human.new("Jim Halpert")
dwight = Human.new("Dwight K. Schrute")

# Let's call a couple of methods
jim.species #=> "H. sapiens"
jim.name #=> "Jim Halpert"
jim.name = "Jim Halpert II" #=> "Jim Halpert II"
jim.name #=> "Jim Halpert II"
dwight.species #=> "H. sapiens"
dwight.name #=> "Dwight K. Schrute"

# Call the class method
Human.say("Hi") #=> print Hi and returns nil