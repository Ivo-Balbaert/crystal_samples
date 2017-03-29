# Provoke exception
raise "OH NO!"
raise Exception.new("Some error")

# Defining custom exceptions
class MyException < Exception
end

class AnotherException < Exception; end

# Catching exceptions with begin rescue
begin
  raise "OH NO!"
rescue
  puts "Rescued!"   # => Rescued!
end

# Access to exception variable
begin
  raise "OH NO!"
rescue ex
  puts ex.message  # => OH NO!
end

# Catch one type of exception
begin
  raise MyException.new("OH NO!")
rescue MyException
  puts "Rescued MyException"  # => # Output: Rescued MyException
end

begin
  raise MyException.new("OH NO!")
rescue ex : MyException
  puts "Rescued MyException: #{ex.message}"
end
# => Rescued MyException: OH NO!

# Multiple rescue branches
ex = begin
   raise MyException.new
rescue ex1 : IndexError
  "ex1"
rescue ex2 : MyException | AnotherException
  "ex2"
rescue ex3 : Exception
  "ex3"
rescue  # catch any kind of exception
  "an unknown exception"
end
p ex #=> "ex2"

# Concrete example:
begin
  raw_file = File.read(path)
  map = JSON.parse(raw_file)
  File.write(path, "ok")
  :ok
rescue Enoent
  raise "Could not read file"
rescue JSON::ParseException
  raise "Could not parse file"
rescue ex
  raise "Other error"
end

# Ensure clause
# Will print "Cleanup..." after invoking something_dangerous,
# regardless of whether it raised or not
begin
  something_dangerous
ensure
  puts "Cleanup..."
end

begin
  something_dangerous
rescue
  # ...
ensure
  # this will always be executed
end

# Else clause
begin
  something_dangerous
rescue
  # execute this if an exception is raised
else
  # execute this if an exception isn't raised
end

# Type inference and exceptions
begin
  a = something_dangerous_that_returns_Int32
ensure
  puts a + 1 # error, undefined method '+' for Nil
end

begin
  a = 1
  something_dangerous
ensure
  puts a + 1 # error, undefined method '+' for Nil
end

# Better than the above: `a` doesn't need
# to be in the exception handling code.
a = 1
begin
  something_dangerous
ensure
  puts a + 1 # works
end

# Alternative ways to do error handling
array = [1, 2, 3]
array[4]  # raises because of IndexError
array[4]? # returns nil because of index out of bounds