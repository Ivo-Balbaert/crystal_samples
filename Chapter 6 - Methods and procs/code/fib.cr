# (fib.cr - is also valid Ruby code)
def fib(n)
  if n <= 1
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end

puts fib(42) # => 433494437

