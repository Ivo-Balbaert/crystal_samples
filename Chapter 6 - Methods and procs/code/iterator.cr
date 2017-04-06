a = 0
fib = Iterator.of do
  a += 1
  a
end

fib.next    # => 1
fib.next    # => 2
fib.next    # => 3
fib.next    # => 4


a = 0
b = 1
fib = Iterator.of do
  ret = a
  a = b
  b += ret
  ret
end

fib.next    # => 0
fib.next    # => 1
fib.next    # => 1  
fib.next    # => 2
fib.next    # => 3
fib.next    # => 5
fib.next    # => 8  
fib.next    # => 13

a = 0
b = 1
fib = Iterator.of {ret = a;   a = b;  b += ret;  ret}

fib
    .select { |x| x.even? }
    .first(10)
    .to_a   # => [0, 2, 8, 34, 144, 610, 2584, 10946, ...]