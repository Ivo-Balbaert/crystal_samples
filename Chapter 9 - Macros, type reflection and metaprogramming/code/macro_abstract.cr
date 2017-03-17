# define_abstract is a macro which receives a class name (as constant, string, or symbol) 
# and a variadic list of abstract method names, and then uses this information to generate 
# an abstract class. For test purposes we then inherit from our newly defined class, 
# but since we forgot to implement the second method, we will get a compiler error 
# reminding us that we still have to provide an implementation for
# Abstract#two in our Concrete class.

macro define_abstract(klass, *names)
  abstract class {{klass.id}}
    {% for name, _index in names %}
      abstract def {{name.id}}
    {% end %}
  end
end

define_abstract Abstract, :one, :two
  
class Concrete < Abstract
  def one
    1
  end
end
# abstract `def Abstract#two()` must be implemented by Concrete