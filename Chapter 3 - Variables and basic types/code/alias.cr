alias PInt32 = Pointer(Int32)

# Can be used to talk about recursive types
alias RecArray = Array(Int32) | Array(RecArray)
ary = [] of RecArray
ary.push [1, 2, 3]
ary.push ary
p ary #=> [[1, 2, 3], [...]]

# Json example
module Json
  alias Type = Nil |
               Bool |
               Int64 |
               Float64 |
               String |
               Array(Type) |
               Hash(String, Type)
end