# To define an array that accepts its own type recursively you can use a
# recursive alias:
alias Atom = String | Int32 | Array(Atom)
 
atom = [] of Atom
atom.push(1)
atom.push("Hello")
atom.push([2, 3, "foo"] of Atom)
 
pp atom
