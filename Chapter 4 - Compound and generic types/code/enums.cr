enum Color
  Red       # value 0
  Green     # value 1
  Blue      # value 2
end

enum Color
  Red         # 0
  Green       # 1
  Blue   = 5  # overwritten to 5
  Yellow      # 6 (5 + 1)
end

Color::Red #:: Color
p Color::Green.value #=> 1

# Enums from integers (to convert integers from C to enums in Crystal)
puts Color.new(1)  #=> "Green"
puts Color.new(10) #=>  "10"

# underlying type can be changed:
enum Color : UInt8
  Red
  Green
  Blue
end

Color::Red.value #:: UInt8

# Flags attribute:
@[Flags]
enum IOMode
  Read # 1
  Write  # 2
  Async # 4
end

IOMode::None.value #=> 0
IOMode::All.value  #=> 7

puts(Color::Red)                    # => "Red"
puts(IOMode::Write | IOMode::Async) # => "Write, Async"

# Enums can have methods:
enum Color
  Red
  Green
  Blue

  def red?
    self == Color::Red
  end
end

p Color::Red.red?  #=> true
p Color::Blue.red? #=> false

# Enums are a type-safe alternative to Symbol
def paint(color : Color)
  case color
  when Color::Red
    # ...
  else
    # Unusual, but still can happen
    raise "unknown color: #{color}"
  end
end     

paint Color::Red

enum Suit
  Spades
  Diamonds
  Clubs
  Hearts
end

p Suit::Spades.value #=> 0

