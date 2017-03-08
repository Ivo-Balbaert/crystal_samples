integer = /\d+/       # + = one or more digits
two_way = /this|that/ # this or that
# other exmples: see courses !!
slash = /\// # a slash / must be escaped by a \
pat = %r(this | that)

"foobarbaz" =~ /(.+)bar(.+)/ #=> 0
p $1                           #=> "foo"
p $2                           #=> "baz

p "peach".match /p([a-z]+)ch/   #=> #<Regex::MatchData "peach" 1:"ea">
p /p([a-z]+)ch/.match "peach"   #=> #<Regex::MatchData "peach" 1:"ea">
p /p([a-z]+)ch/ =~ "peach"      #=> 0
p "peach".scan /p([a-z]+)ch/    #=> [#<Regex::MatchData "peach" 1:"ea">]
