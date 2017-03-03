# Invoking the program's method with ::
def baz(x, y)
  x + y
end

class Foo
  def bar
    baz(4, 2) #=> 2
    ::baz(4, 2) #=> 6
  end

  def baz(x, y)
    x - y
  end
end

# Code that is executed as main code can also be inside type declarations.
# This is a program that prints "Hello"
class Hello
  # 'self' here is the Hello class
  puts self
end
