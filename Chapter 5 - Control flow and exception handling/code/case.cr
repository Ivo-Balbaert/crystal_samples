# Case statement
# test on value

cmd = "move"
action = case cmd
  when "create"
    "Creating..."
  when "copy"
    "Copying..."
  when "move"
    "Moving..."
  when "delete"
    "Deleting..."
end
action #=> "Moving..."

# test on type
case var
when String
  # var : String
  do_something
when Int32
  # var : Int32
  do_something_else
else
  # here var is neither a String nor an Int32
  do_another_thing
end

# Invoking a method on the case expression
case num
when .even?
  do_something
when .odd?
  do_something_else
end

# Testing on a condition
case
when cond1, cond2
  do_something
when cond3
  do_something_else
end

# Case expression can be tuple literal
# Tuple size must match
case {value1, value2}
when {0, 0} # OK, 2 elements
  # ...
when {1, 2, 3} # Compiler error, because it will never match
  # ...
end
# Underscore allowed
case {value1, value2}
when {0, _}
  # Matches if 0 === value1, no test done against value2
when {_, 0}
  # Matches if 0 === value2, no test done against value1
end
# Implicit-object allowed
case {value1, value2}
when {.even?, .odd?}
  # Matches if value1.even? && value2.odd?
end
# Comparing against a type will perform an is_a? check
case {value1, value2}
when {String, Int32}
  # Matches if value1.is_a?(String) && value2.is_a?(Int32)
  # The type of value1 is known to be a String by the compiler,
  # and the type of value2 is known to be an Int32
end