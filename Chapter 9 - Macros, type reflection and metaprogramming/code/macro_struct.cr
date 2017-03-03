struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

struct Struct
  def ==(other : self) : Bool
    {% for ivar in @type.instance_vars %}
	  return false unless @{{ivar.id}} == other.@{{ivar.id}}
	{% end %}
    true
  end
end

struct A
  name : String
  age : Int32
end

struct B
  bname : String
  bage : Int16
end

p A == B # => false
