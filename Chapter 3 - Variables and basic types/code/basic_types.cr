p nil.class  # => Nil
p true.class # => Bool

# boolean operators
!false #=> true  : Bool
!true #=> false  : Bool

# truth tables

# When are values truthy or falsey? 
# Falsey values are: nil, false and null pointers
!nil   #=> true  : Bool
# 0 is truthy:
!0     #=> false : Bool

# && and || can be used with any kind of value!
a = nil
b = "London"
p a && b # => nil
p a || b # => "London"

result = value.as?(Int32) || 10  # if value is not an Int32, result is 10

# shortcut syntax:
# if local is false or nil, it is set to 1, otherwise it stays the same
local ||= 1 # same as: local || (local = 1)
# if local is true, it is set to 1
local &&= 1 # same as: local && (local = 1)


# integers
p 42.class  #=> Int32
p -100.class #=> Int32

# signed
p 1_i8.class  #=> Int8
p 1i8.class   #=> Int8 - _ is optional
p 1_i16.class #=> Int16
p 1_i32.class #=> Int32
p 1_i64.class #=> Int64

# unsigned
p 1_u8.class  #=> UInt8
p 1_u16.class #=> UInt16
p 1_u32.class #=> UInt32
p 1_u64.class #=> UInt64

p 2147483648.class          # Int64
p 9223372036854775808.class # UInt64
p 1_000_000_001

p 1 + 2 #=> 3
p 1.+ 2 #=> 3
p 2 * 3 #=> 6
p 5 - 8 #=> -3
p 9 / 2 #=> 4 # integer division gives an integer
p 9 % 2 #=> 1
p 5 * (12 - 8) + -15 # 5
p 5**2        # 25
p 6 ^ 2 # => 4  - bitwise xor operator

# shortcut syntax:
local += 1 # same as: local = local + 1
# same syntax for: -, *, /, %, |, &, ^, **, <<, >>

# shift operators:
# <<, >>

# modular arithmetic on overflow.
x = 127_i8  # An Int8 type
puts x # 127
x += 1 # -128
x += 1 # -127

p 3.to_f # => 3.0

# Floats
p 1.0.class #=> Float64

# There are two floating point types
p 1.0_f32.class #=> Float32
p 1_f32.class   #=> Float32
p 1e10.class    #=> Float64
p 1.5e10.class  #=> Float64
p 1.5e-7.class  #=> Float64

p 1.0 + 2.0 # 3.0   
p 2.0 * 3.0 # 6.0
p 5.0 - 8.0 # -3.0
p 9.0 / 2.0 # 4.5

p "32".to_i # => 32
p 3.14159.to_i # => 3    # no warning for loss of decimal digits!
# p "Hello".to_i # => invalid Int32: Hello (ArgumentError)
p -2.3.to_i    # => -2

p 32.to_f        # => 32.0
p "3.14159".to_f # >= 3.14159

p (5 - 2).abs # 3
p rand        # 0.93596666693734609 # 0 <= x < 1
p rand(100)   # 96 - random number 0 <= x < 100

r = Random.new(42)  # seed 42
puts r.rand   # => 0.54609542433313152
puts r.rand   # => 0.22202384068989947

y = Random.new(42)
puts y.rand  # => 0.54609542433313152
puts y.rand  # => 0.22202384068989947

# Math constants and functions
p typeof(Math) # => Class
p Math::PI             # 3.1415926535897931
p Math.log(Math::E**2) # 2.0

signal_power = 42
noise_power = 5
p ratio = signal_power / noise_power  # => 8
p decibels = 10 * Math.log(ratio, 10) # => 9.0308998699194341

radians = 0
p x = Math.cos(radians)           # => 1.0
degrees = 45
radians = degrees / 180.0 * Math::PI
p Math.sin(radians) # => 0.70710678118654746

p golden = (Math.sqrt(5) + 1) / 2 # => 1.6180339887498949


# Chars
'a'.class   #=> Char
'あ'.class  #=> Char
# Octal codepoint
'\101'      #=> 'A' : Char
# Unicode codepoint
'\u0041'    #=> 'A' : Char
'\u{41}'    # == 'A'
'\u{1F52E}' # == '🔮'

p 3 != 5    #=> true
p 3 == 3.0  #=> true
p 3 < -1.0  #=> false

# constants
Con = "I'm a constant"
Con = "can't be updated" # Error: already initialized constant Con

PI = 3.14
