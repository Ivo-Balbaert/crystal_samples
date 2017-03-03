# without macro
class Person
  def address
    @address
  end

  def age
    @age
  end
end

# code duplication!
# define a macro for this:
macro getter(name)
  def {{name}}
    @{{name}}
  end
end

class Person
  getter address
  getter age
end

# how to make it into:  getter address, age  
macro getter(*names)
  {% for name in names %}
    def {{name}}
      @{{name}}
    end
  {% end %}
end

class Person
  getter address, age
end