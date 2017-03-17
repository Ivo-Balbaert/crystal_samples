# Custom separator and quote for CSV
# The separator and quote field for parsing CSV can now be specified at construction time:
require "csv"

string = <<-CSV
         name;value
         foo;bar
         CSV
CSV.parse(string, separator: ';') # => [["name", "value"], ["foo", "bar"]]  