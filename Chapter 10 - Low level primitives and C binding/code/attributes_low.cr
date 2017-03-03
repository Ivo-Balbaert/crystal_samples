# Link

# Extern
# example 1
@[Extern]
struct MyStruct
end

lib MyLib
  fun my_func(s : MyStruct) # OK (gives an error without the Extern attribute)
end

 example 2
# A struct to easily convert between Int32 codepoints and Chars
@[Extern(union: true)]
struct Int32OrChar
  property int = 0
  property char = '\0'
end

s = Int32OrChar.new
s.char = 'A'
s.int # => 65

s.int = 66
s.char # => 'B'

# ReturnsTwice

# CallConvention
lib LibFoo
  @[CallConvention("X86_StdCall")]
  fun foo : Int32
end
