# Example of inherited:
class Parent
  macro inherited
    def lineage
      "{{@type.name.id}} < Parent"
    end
  end
end

class Child < Parent
end

Child.new.lineage #=> "Child < Parent"

# method_missing:
# Example 1 
macro method_missing(call)
  print "Got missing method", {{call.name.id.stringify}}, " with ", 
        {{call.args.size}}, " arguments", '\n'
end

foo          # Prints: Got missing method foo with 0 arguments
bar 'a', 'b' # Prints: Got missing method bar with 2 arguments

# Example 2
class Greeter
  def greet(name)
    "Hello #{name}!"
  end
  
  macro method_missing(call)
    greet({{call.name.id.stringify.capitalize}})
  end
end

g = Greeter.new
g.readers #=> "Hello Readers!" : String

# Example 3
class Foo
  macro method_missing(name, args, block)
    {{pp name}}
  end
end

Foo.new.hello_world
# => name = "hello_world"
Foo.new.bla_bla("bla")
# => name = "bla_bla"

# Example of included:
module Foo
  macro included
    {% if @type.name == "Bar" %}
    def self.hello
      puts "Bar"
    end
    {% else %}
    def self.hello
      puts "HELLO"
    end
    {% end %}
  end
end

module Bar
  include Foo
end

module Something
  include Foo
end

Bar.hello # => "Bar"
Something.hello # => "HELLO"