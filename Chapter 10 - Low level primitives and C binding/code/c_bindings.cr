# A lib declaration
@[Link("pcre")]
lib LibPCRE
end

# attributes
# @[Link("pcre")] will pass -lpcre to the linker, 
    # but the compiler will first try to use pkg-config.
# @[Link(ldflags: "...")] will pass those flags directly to the linker, 
    # without modification. For example: @[Link(ldflags: "-lpcre")]. 
    # A common technique is to use backticks to execute commands: 
    # @[Link(ldflags: "`pkg-config libpcre --libs`")].
# @[Link(framework: "Cocoa")] will pass -framework Cocoa to the linker 
    # (only useful in Mac OS X).

# A fun declaration
lib C   # should this be lib LibC ???
   fun printf(format : UInt8*, ...) : Int32
   fun cos(value : Float64) : Float64 # from C: double cos(double x)
   fun getch : Int32
   fun srand(seed : UInt32)
   fun waitpid(pid : Int32, status_ptr : Int32*, options : Int32) : Int32
   fun exit(status : Int32) : NoReturn
   fun memcmp(p1 : Void*, p2 : Void*, size : C::SizeT) : Int32
   fun sleep(seconds : UInt32) : UInt32
# declares a C struct
   struct TimeZone
    minutes_west : Int32
    dst_time     : Int32
  end
# declares a C union
  union IntOrFloat
    some_int : Int32
    some_float : Float64
  end
# declares a C enum
  enum SomeEnum
    Zero
    One
    Two
    Three
  end
# variables
   $errno : Int32
end

sleep(1_u32) # sleep has type UInt32

C.exit(1)    # this is NoReturn
puts "hello" # this will never be executed
# pid = ...
# options = ...
# C.waitpid(pid, out status_ptr, options)

# use as if it was a class method:
# C.cos(1.5) #=> 0.0707372 # Error: undefined reference to 'cos' ??? also with LibC
# C.getch
p C.srand(1_u32)  # => nil

# to_unsafe method
class IntWrapper
  def initialize(@value)
  end

  def to_unsafe
    @value
  end
end

wrapper = IntWrapper.new(1)
C.exit(wrapper) # wrapper is not an Int32, but its to_unsafe
                # method is, so wrapper.to_unsafe
                # is passed instead


a = 1
b = 2
C.printf "%d + %d = %d\n", a, b, a + b  # => 1 + 2 = 3

tz = C::TimeZone.new
tz.minutes_west = 1
tz.minutes_west #=> 1

value = U::IntOrFloat.new
value.some_int = 1
value.some_int #=> 1
value.some_float #=> 4.94066e-324

X::SomeEnum::One #=> One

C.errno #=> some value
C.errno = 0
C.errno #=> 0

########################################################
lib X
# variable number of arguments
  fun variadic(value : Int32, ...) : Int32
# callback
  # In C:
  #
  #    void callback(int (*f)(int));
  fun callback(f : Int32 -> Int32)
end

X.variadic(1, 2, 3, 4)

f = ->(x : Int32) { x + 1 }
X.callback(f)

# give the function another name for Crystal:
lib LibSDL
  fun init = SDL_Init(flags : UInt32) : Int32
end

# use a string as a name
lib LLVMIntrinsics
  fun ceil_f32 = "llvm.ceil.f32"(value : Float32) : Float32
end

# LibC lib in standard library 
# with aliases for common C types, like int, short, size_t. 
# Use them in bindings like this:
lib MyLib
  fun my_fun(some_size : LibC::SizeT)
end

