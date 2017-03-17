require "json"

data = <<-JSON
  {
    "files": [
        {
          "id": 1,
          "name": "photo.jpg"
        },
        {
          "id": 99,
          "name": "another.jpg"
        }
    ]
  }
  JSON

obj = JSON.parse(data)

obj["files"].each do |item|
  puts item["id"].as_i
end

# => 1
# => 99
