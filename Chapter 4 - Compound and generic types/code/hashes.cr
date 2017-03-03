# hash literals:
{1 => 2, 3 => 4}     # class: Hash(Int32, Int32)
{1 => 2, 'a' => 3}   # class: Hash(Int32 | Char, Int32)

# creating an empty hash:
# {}                   # syntax error
{} of Int32 => Int32   # {} 
Hash(Int32, Int32).new # {}

# Look up value by key
hash = {"color" => "green", "number" => 5}
p hash["color"]        #=> "green"
p hash["no_such_key"]  #=> Missing hash key: "no_such_key" (KeyError)
p hash["no_such_key"]? #=> nil

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
