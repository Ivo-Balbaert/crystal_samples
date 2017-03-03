# ThreadLocal
class DontUseThis
  # One for each thread
  @[ThreadLocal]
  @@values = [] of Int32
end

# AlwaysInline
@[AlwaysInline]
def foo
  1
end

# NoInline
@[NoInline]
def foo
  1
end

# Raises



# Flags:  see ch 4 , enums.cr