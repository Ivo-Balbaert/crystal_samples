# A def is implicitly considered a macro def 
# if it contains a macro expression which refers to @type
class Object
  def instance_vars_names
    {{ @type.instance_vars.map &.name.stringify }}
  end
end

class Person
  def initialize(@name : String, @age : Int32)
  end
end

person = Person.new "John", 30
person.instance_vars_names #=> ["name", "age"]

#
class Object
  def has_instance_var?(name) : Bool
    # We cannot access name inside the macro expansion here,
    # instead we need to use the macro language to construct an array
    # and do the inclusion check at runtime.
    {{ @type.instance_vars.map &.name.stringify }}.includes? name
  end
end

person = Person.new "John", 30
person.has_instance_var?("name") #=> true
person.has_instance_var?("birthday") #=> false