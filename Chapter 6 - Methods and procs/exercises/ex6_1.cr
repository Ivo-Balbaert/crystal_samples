# example 1
def add(x, y)   
  x + y
end

def add(x : Number, y : Number)  
  x + y
end

def add(x : Int, y : Int)  
  x + y
end

p add 1, 2    # => 3
p add 1.0, 3.14 # => 4.14
p add "Hello,", " world!" # =>  "Hello, world!"

def add(x: Number, y: String)
    x.to_s + y
end

p add 3, "Crystal"  # => "3Crystal"
p "12", "13"  # => "1213"
# solution:

def add(x : String, y : String)
    add x.to_i, y.to_i
end

p "12", "13"  # => 25
