# Tip 1 - Don't create intermediate strings when writing to an IO
# see benchmark1.cr
puts 123.to_s # Bad
puts 123      # Good

class MyClass
  # Good
  def to_s(io)
    # appends "1, 2" to IO without creating intermediate strings
    x = 1
    y = 2
    io << x << ", " << y
  end

  # Bad
  def to_s(io)
    x = 1
    y = 2
    # using a string interpolation creates an intermediate string.
    # this should be avoided
    io << "#{x}, #{y}"
  end
end

# Tip 2 - Avoid creating temporary objects over and over
lines_with_language_reference = 0
while line = gets
  if ["crystal", "ruby", "java"].any? { |string| line.includes?(string) }
    lines_with_language_reference += 1
  end
end
puts "Lines that mention crystal, ruby or java: #{lines_with_language_reference}"

# Solutions:
# 1- use a Tuple: {"crystal", "ruby", "java"} instead of ["crystal", "ruby", "java"]
# 2- Move the array to a constant.
LANGS = ["crystal", "ruby", "java"]
lines_with_language_reference = 0
while line = gets
 if LANGS.any? { |string| line.includes?(string) }
   lines_with_language_reference += 1
 end
end
puts "Lines that mention crystal, ruby or java: #{lines_with_language_reference}"

# Tip 3 - Use structs when possible
require "benchmark"

class PointClass
  getter x
  getter y

  def initialize(@x : Int32, @y : Int32)
  end
end

struct PointStruct
  getter x
  getter y

  def initialize(@x : Int32, @y : Int32)
  end
end

Benchmark.ips do |x|
  x.report("class") { PointClass.new(1, 2) }
  x.report("struct") { PointStruct.new(1, 2) }
end

# Results:
# class  28.17M (± 2.86%) 15.29× slower
# struct 430.82M (± 6.58%)       fastest

# Tip 4 - Iterating strings
# iterating a String in this way is not optimal, and has a complexity of O(n^2):
# string.size is also slow
string = "..."
while i < string.size
  char = string[i]
  # ...
end

# Solution: use an interation method
# each_char, each_byte, each_codepoint, or use the more low-level Char::Reader struct.
string = "..."
string.each_char do |char|
  # ...
end

# Tip 5 - Use string builder when concatenating strings
# Performance comparison:
age = 61
p "age: " + age.to_s   # => age: 61 # creates a string on the heap!
# better:
p "age:  + #{age}"     # => age: 61
# still beter: use string builder
str = String.build do |io|
    io << "age: " << age
end
p str                   # => age: 61