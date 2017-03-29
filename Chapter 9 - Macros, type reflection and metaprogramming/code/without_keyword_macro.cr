class Person
  getter name = "ivo"
  property age = 61

  def initialize(@name, @age)
  end
end


class Object
  def has_instance_var?(name) : Bool
    {{ @type.instance_vars.map &.name.stringify }}.includes? name
  end
end

person = Person.new "John", 30
person.has_instance_var?("name") #=> true
person.has_instance_var?("birthday") #=> false