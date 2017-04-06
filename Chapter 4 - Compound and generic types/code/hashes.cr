# hash literals:
{1 => 2, 3 => 4}     # class: Hash(Int32, Int32)
{1 => 2, 'a' => 3}   # class: Hash(Int32 | Char, Int32)

phones = {
  "Ary" => "15512312312",
  "Brian" => "1545645645",
  "Juan" => "1578978978",
}
puts phones["Brian"] # => "1545645645"

# creating an empty hash:
# {}                   # syntax error
{} of Int32 => Int32   # {} 
Hash(Int32, Int32).new # {}
salaries = {} of String => Int32

a = {} of String => Int32
a["gs"] = 1905
puts a # => {"gs" => 1905}

b = Hash(Int32 | Char, Int32){3 => 4}
b[1] = 2
b['a'] = 9
puts b  # => {3 => 4, 1 => 2, 'a' => 9}

p b.size   # => 3

b.delete('a')
puts b # => {3 => 4, 1 => 2}

# Look up value by key
hash = {"color" => "green", "number" => 5}
p hash["color"]        #=> "green"
p hash["letter"]  #=> Missing hash key: "letter" (KeyError)
p hash["letter"]? #=> nil

# Check existence of key
hash.has_key? "color" #=> true

# Special notation for symbol and string keys
{key1: 'a', key2: 'b'}     # same as {:key1 => 'a', :key2 => 'b'}
{"key1": 'a', "key2": 'b'} # same as {"key1" => 'a', "key2" => 'b'}

# Hash-like types
MyHashType{"foo" => "bar"}

# Shortcut for adding a pair
h = {1 => 2}
h[3] ||= 4
p h  # => {1 => 2, 3 => 4}

h1 = {} of String => Bool
h1["hello"] = true
h1["world"] = false
h1["42"] = "error?"  # => Error  no overload matches ...

# Union types
h1 = {} of String | Int32 => Bool | String
h1["hello"] = true
h1["world"] = false
h1["42"] = "error?"  # =>  ok!

# Nested hashes
cats = {
  :Ferguson => {
    :weight => "fat"
  }
}
cats[:Ferguson][:weight] #=> "fat" : String