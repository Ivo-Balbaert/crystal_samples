require "./sample/*"
require "kemal"

module Sample
  get "/" do
    "Hello Crystal world from the web!"
  end
end

Kemal.run

# Output:
# run localhost:3000 in browser
# text "Hello Crystal world from the web!" appears on web page
