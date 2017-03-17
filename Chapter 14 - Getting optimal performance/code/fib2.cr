# example 2: (fib2.cr - is also valid Ruby code)
def fib(n)
  return n if n <= 1
  fib(n - 1) + fib(n - 2)
end

puts fib(40)

# ivo@ivo-SATELLITE-L50D-B:~/crystal$ time ruby fib2.cr

# 102334155

# real  0m33.948s
# user  0m33.556s
# sys   0m0.016s

# 11.2 x
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ time crystal fib2.cr
# 102334155

# real  0m3.042s
# user  0m4.156s
# sys   0m0.352s

# 20.1 x
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ crystal build fib2.cr
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ ls -l fib*
# -rwxrwxr-x 1 ivo ivo 453288 Jan  3 10:45 fib
# -rwxrwxr-x 1 ivo ivo 827088 Jan  4 11:48 fib2
# -rw-rw-r-- 1 ivo ivo    100 Jan  4 11:45 fib2.cr
# -rw-rw-r-- 1 ivo ivo    111 Jan  3 10:43 fib.cr
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ time ./fib2
# 102334155

# real  0m1.689s
# user  0m1.692s
# sys   0m0.000s

# 26 x
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ crystal build --release fib2.cr
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ ls -l fib*
# -rwxrwxr-x 1 ivo ivo 453288 Jan  3 10:45 fib
# -rwxrwxr-x 1 ivo ivo 453288 Jan  4 11:50 fib2
# -rw-rw-r-- 1 ivo ivo    100 Jan  4 11:45 fib2.cr
# -rw-rw-r-- 1 ivo ivo    111 Jan  3 10:43 fib.cr
# ivo@ivo-SATELLITE-L50D-B:~/crystal$ time ./fib2
# 102334155

# real  0m1.307s
# user  0m1.300s
# sys   0m0.008s
