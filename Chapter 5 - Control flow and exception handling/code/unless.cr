unless some_condition
  then_expression
else
  else_expression
end

# The above is the same as:
if some_condition
  else_expression
else
  then_expression
end

# Can also be written as a suffix
close_door unless door_closed?