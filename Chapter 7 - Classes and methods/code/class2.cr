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
