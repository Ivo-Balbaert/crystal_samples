require "./simple_kemal_app/*"
require "kemal"

logging false # no output on terminal where kemal is started


module SimpleKemalApp
  get "/" do
    "Hello, World!"
  end
end

Kemal.run
