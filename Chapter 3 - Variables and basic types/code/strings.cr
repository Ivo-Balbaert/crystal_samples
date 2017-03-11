# Strings
"s".class #=> String
""  # empty string  

# Strings are immutable
s = "hello, "  #=> "hello, "        : String
s.object_id    #=> 4802176          : UInt64
t = "hello, "  #=> "hello, "        : String
t.object_id    #=> 4802208          : UInt64
p s[1] # => e
s[2] = "z"  # Error: undefined method '[]=' for String

# to_s
p 32.to_s      # => "32"
p 3.14159.to_s # => "3.14159"

# Concatenation
p "I like" + " soup" # I like soup

first_name = "Jim"
last_name = "Tapper"
name = first_name + " " + last_name
p name # Jim Tapper

p "I" * 5            # IIIII
p s += "Crystal" #=> "hello, Crystal" : String

# Multiline string
"This is
   multiline string"

# Supports interpolation
p "The sum = #{1 + 2}" #=> "The sum = 3"

# Escaping special characters:
p "You're nice!" # You're nice!
# p "Why do you say: "You're nice!"?"  # unexpected token
p "Why do you say: \"You're nice!\"?"       # Why do you say: "You're nice!"?
p "double quote at the end of a string: \"" #
p "backslash at the end of a string: \\"    #

# String with double quotes
%(hello "world") #=> "hello \"world\""

# Heredoc:
p <<-IDENT
Hello Crystal
    world!
IDENT
# => "Hello Crystal\n    world"

# Some methods:
var1 = "post"
p var1.reverse    # =>"tsop"
p var1.size       # => 4   # length or len do not exist in crystal
p var1.upcase     # => "POST"
p "POST".downcase # => "post"
p var1.capitalize # => "Post"

var1 = "test"
p var1.includes? "es"   # => true
p var1.count "t"  # => 2
p var1.starts_with? "te"  # => true
p var1.ends_with? "st" # => true
p var1.index("e") # => 1
p {"a", "b"}.join("-") # => a-b
p "foo".gsub("o", "0") # => f00
p "foo".sub("o", "0")  # => f0o
p "a-b-c-d-e".split("-") # => ["a", "b", "c", "d", "e"]

"Hello World".each_char do |char|
  puts char
end