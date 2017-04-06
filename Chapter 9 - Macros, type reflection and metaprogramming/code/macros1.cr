# example 1
macro define_method(name, content)
  def {{name}}
    {{content}}
  end
end

define_method foo, 1
# This generates:
#
#     def foo
#       1
#     end

foo #=> 1

# must be valid Crystal code
# define_method :foo, 1   # Error: ...
# This generates:
#
#     def :foo
#       1
#     end

# Macro calls with a symbol
macro define_method(name, content)
  def {{name.id}}
    {{content}}
  end
end

define_method :foo, 1
# This correctly generates:
#
#     def foo
#       1
#     end

# example 2 - with a block
macro define_method(name, &block)
  def {{name.id}}
  {{block.body}}
  end
end

define_method :greet do
  puts "hello"
end

greet # => hello

#
# example 3
# using with ... yield
class Foo
  macro emphasize(value)
    "***#{ {{value}} }***"
  end

  def yield_with_self
    with self yield
  end
end

Foo.new.yield_with_self { emphasize(10) } #=> "***10***"

# invocation outside class
class Foo
  macro emphasize(value)
    "***#{ {{value}} }***"
  end
end

Foo.emphasize(10) # => "***10***"

# Conditionals
#  inside a macro
macro define_method(name, content)
  def {{name}}
    {% if content == 1 %}
      "one"
    {% else %}
      {{content}}
    {% end %}
  end
end

define_method foo, 1
define_method bar, 2

foo #=> one
bar #=> 2

#  outside a macro
{% if env("TEST") %}
  puts "We are in test mode"
{% end %}

# Iteration
# To iterate an ArrayLiteral:
macro define_dummy_methods(names)
  {% for name, index in names %}  # index is optional
    def {{name.id}}
      {{index}}
    end
  {% end %}
end

define_dummy_methods [foo, bar, baz]

foo #=> 0
bar #=> 1
baz #=> 2

# To iterate a HashLiteral:
macro define_dummy_methods(hash)
  {% for key, value in hash %}
    def {{key.id}}
      {{value}}
    end
  {% end %}
end
define_dummy_methods({foo: 10, bar: 20})
foo #=> 10
bar #=> 20

# Used outside a macro definition:
{% for name, index in ["foo", "bar", "baz"] %}
  def {{name.id}}
    {{index}}
  end
{% end %}

foo #=> 0
bar #=> 1
baz #=> 2

# Variadic arguments and splatting
macro define_dummy_methods(*names)
  {% for name, index in names %}
    def {{name.id}}
      {{index}}
    end
  {% end %}
end

define_dummy_methods foo, bar, baz

foo #=> 0
bar #=> 1
baz #=> 2

macro println(*values)
   print {{*values}}, '\n'
end

println 1, 2, 3 # => 123\n

# Constants
VALUES = [1, 2, 3]

{% for value in VALUES %}
  puts {{value}}
{% end %}

# Fresh macro variables
macro update_x
  x = 1
end

x = 0
update_x
x #=> 1

macro dont_update_x
  %x = 1
  puts %x
end

x = 0
dont_update_x # => 1
x #=> 0

macro fresh_vars_sample(*names)
  # First declare vars
  {% for name, index in names %}
    print "Declaring: ", "%name{index}", '\n'
    %name{index} = {{index}}
  {% end %}

  # Then print them
  {% for name, index in names %}
    print "%name{index}: ", %name{index}, '\n'
  {% end %}
end

fresh_vars_sample a, b, c

# Sample output:
# Declaring: __temp_255
# Declaring: __temp_256
# Declaring: __temp_257
# __temp_255: 0
# __temp_256: 1
# __temp_257: 2

macro compile_time_date
  {{ `date`.stringify }}
end

p compile_time_date  # => "Tue Feb 28 11:16:39 CET 2017\n"
p `date`  # ??? test

p compile_time_date  # => "Tue Feb 28 11:16:39 CET 2017\n"
p `date`  # ??? test

