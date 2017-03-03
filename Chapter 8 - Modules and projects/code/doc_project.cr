# Documentation should be positioned right above definitions of classes, modules, 
# and methods. Leave no blanks between them.

# A unicorn is a **legendary animal** (see the `Legendary` module) that has been
# described since antiquity as a beast with a large, spiraling horn projecting
# from its forehead.
class Unicorn
end

# Bad: This is not attached to any class.

class Legendary
end

# The documentation of a method is included into the method summary and the method details. 
# The former includes only the first line, the latter includes the entire documentation. 
# In short, it is preferred to:
#     State a method's purpose or functionality in the first line (Use the third person).
#     Supplement it with details and usages after that.
#     For instance:

# Returns the number of horns this unicorn has.
#
# ```
# Unicorn.new.horns # => 1
# ```
def horns
  @horns
end

# Parameter names should be italicized (surrounded with single asterisks * or underscores _):

# Creates a unicorn with the specified number of *horns*.
def initialize(@horns = 1)
  raise "Not a unicorn" if @horns != 1
end

# Code blocks that have Crystal code can be surrounded with triple backticks 
# or indented with four spaces.

# ```
# unicorn = Unicorn.new
# unicorn.speak
# ```

# or

#     unicorn = Unicorn.new
#     unicorn.speak

# Text blocks, for example to show program output, 
# must be surrounded with triple backticks followed by the "text" keyword.

# ```text
# "I'm a unicorn"
# ```

# To automatically link to other types, enclose them with single backticks.

# the `Legendary` module

# To automatically link to methods of the currently documented type, 
# use a hash like #horns or #index(char), and enclose it with single backticks.
# To automatically link to methods in other types, 
# do OtherType#method(arg1, arg2) or just OtherType#method, 
# and enclose it with single backticks.
# For example:

# Check the number of horns with `#horns`.
# See what a unicorn would say with `Unicorn#speak`.

# To show the value of an expression inside code blocks, use # =>.
1 + 2             # => 3
Unicorn.new.speak # => "I'm a unicorn"

# Use ditto to use the same comment as in the previous declaration.

# ditto
def number_of_horns
  horns
end

# Use :nodoc: to hide public declarations from the generated documentation. 
# Private and protected methods are always hidden.

class Unicorn
  # :nodoc:
  class Helper
  end
end

# Flagging Classes, Modules, and Methods
# Given a valid keyword, Crystal will automatically generate visual flags 
# that help highlight problems, notes and/or possible issues.
# The supported flag keywords are:

# BUG
# DEPRECATED
# FIXME
# NOTE
# OPTIMIZE
# TODO

# Flag keywords must be the first word in their respective line and must be in all caps. 
# An optional trailing colon is preferred for readability.

# Makes the unicorn speak to STDOUT
#
# NOTE: Although unicorns don't normally talk, this one is special
# TODO: Check if unicorn is asleep and raise exception if not able to speak
# TODO: Create another `speak` method that takes and prints a string
def speak
  puts "I'm a unicorn"
end

# Makes the unicorn talk to STDOUT
#
# DEPRECATED: Use `speak`
def talk
  puts "I'm a unicorn"
end
