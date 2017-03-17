# has to be in a project that includes kemal as a shard
require "kemal"

get "/" do
  {name: "Kemal", awesome: true}
end

Kemal.run