# is_a?
a = 1
a.is_a?(Int32)          #=> true
a.is_a?(String)         #=> false
a.is_a?(Number)         #=> true
a.is_a?(Int32 | String) #=> true

if a.is_a?(Int32)
  a.succ # Ok, here a can only be an Int32
end

# nil?
a = 1
a.nil?          # => false

b = nil
b.nil?          # => true

# responds_to?
a = 1
a.responds_to?(:abs)    #=> true
a.responds_to?(:size)   #=> false

if a.responds_to?(:succ)
  a.succ # Ok
end

# as
if some_condition
  a = 1
else
  a = "hello"
end
# a : Int32 | String
a_as_int = a.as(Int32)
a_as_int.abs          # works, compiler knows that a_as_int is Int32

1.as(String) # Compile-time error: can't cast Int32 to String

# Casting to a "bigger" type
#example 1
a = 1
b = a.as(Int32 | Float64)
b #:: Int32 | Float64

# example 2
ary = [1, 2, 3]
# We want to create an array 1, 2, 3 of Int32 | Float64
ary2 = ary.map { |x| x.as(Int32 | Float64) }
ary2 #:: Array(Int32 | Float64)
ary2 << 1.5 # OK

# Usage for when the compiler can't infer the type of a block
some_call { |v| v.method.as(ExpectedType) }

# .as?
value = rand < 0.5 ? -3 : nil
result = value.as?(Int32) || 10  # if value is not an Int32, result is 10
value.as?(Int32).try &.abs # # if value is -3, the result is 3, else it is nil

# typeof
a = 1
b = typeof(a) #=> Int32

typeof(1, "a", 'a') #=> (Int32 | String | Char) # if multiple arguments --> union type

# used in generic code
hash = {} of Int32 => String
another_hash = typeof(hash).new #:: Hash(Int32, String)

# can be used on methods at compile time
class Array
  def self.elem_type(typ)
    if typ.is_a?(Array)
      elem_type(typ.first)
    else
      typ
    end
  end
end

nest = [1, ["b", [:c, ['d']]]]
flat = Array(typeof(Array.elem_type(nest))).new
typeof(nest) #=> Array(Int32 | Array(String | Array(Symbol | Array(Char))))
typeof(flat) #=> Array(String | Int32 | Symbol | Char)