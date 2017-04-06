def show(x : Number)
    "#{x} is a number"
end

def show(x : String)
    "#{x} is a string"
end

a = 123
show a

b = "hello"
show b

c = rand < 0.5 ? a : b  # the type of c is only known at runtime
show c                  # so which show method to call can only be decided at runtime
