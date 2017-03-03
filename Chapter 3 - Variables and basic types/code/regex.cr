integer = /\d+/       # + = one or more digits
two_way = /this|that/ # this or that
# other exmples: see courses !!
slash = /\// # a slash / must be escaped by a \
pat = %r(this | that)

"foobarbaz" =~ /(.+)bar(.+)/ #=> 0
p $1                           #=> "foo"
p $2                           #=> "baz
