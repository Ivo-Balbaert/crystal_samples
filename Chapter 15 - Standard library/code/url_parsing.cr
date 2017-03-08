require "uri"
require "http/params"

uri = URI.parse "postgres://user:pass@host.com:5432/path?k=v#f"
p uri
# #<URI:0x9dbea0
#  @fragment="f",
#  @host="host.com",
#  @opaque=nil,
#  @password="pass",
#  @path="/path",
#  @port=5432,
#  @query="k=v",
#  @scheme="postgres",
#  @user="user">

p uri.scheme   # postgres
p uri.user     # user
p uri.password # pass
p uri.host     # host.com
p uri.port     # 5432
p uri.path     # /path
p uri.fragment # f
p uri.query    # k=v

m = HTTP::Params.parse(uri.query.to_s)
p m["k"] # => v