# mixing it up
var1 = 2
var2 = "5"
p var1.to_s + var2 # "25"

var1 = 2
var2 = "5"
p var1 + var2.to_i # 7

p 15.to_f       # 15.0
p "15".to_f     # 15.0
p "99.999".to_f # 99.999
# p "99.999".to_i # invalid Int32: 99.999 (ArgumentError) - in Ruby: 99
