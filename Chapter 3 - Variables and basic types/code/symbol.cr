p :hi # => :hi
p :radius_moon
p :"radius moon"
p :question?
p :shout!
p :+

p :president.class #=> Symbol

sentence = :question?     # :"question?" : Symbol
sentence == :question?    #=> true  : Bool
sentence == :exclamation! #=> false : Bool
sentence == "question?"   #=> false : Bool