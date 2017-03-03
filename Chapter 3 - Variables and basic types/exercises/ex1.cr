p "12 + 12"   # 12 + 12
p "12" + "12" # 1212

# Errors:
# p 5 * "I" # no overload matches 'Int32#*' with type String
# p "12" + 12 # no overload matches 'String#+' with type Int32
# p "2" * "5"   # no overload matches 'String#*' with type String
