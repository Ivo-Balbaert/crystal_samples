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
# To call mathetmatical functions,see c_math.cr:
lib LibC   
   fun printf(format : UInt8*, ...) : Int32
   fun getch : Int32
   fun rand : Int32
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

LibC.exit(1)    # this is NoReturn
puts "hello" # this will never be executed
# pid = ...
# options = ...
# LibC.waitpid(pid, out status_ptr, options)

# use as if it was a class method:
# LibC.getch
p LibC.srand(1_u32)  # => nil
p rand  # => 16807

# to_unsafe method
class IntWrapper
  def initialize(@value)
  end

  def to_unsafe
    @value
  end
end

wrapper = IntWrapper.new(1)
LibC.exit(wrapper) # wrapper is not an Int32, but its to_unsafe
                # method is, so wrapper.to_unsafe
                # is passed instead


a = 1
b = 2
LibC.printf "%d + %d = %d\n", a, b, a + b  # => 1 + 2 = 3

tz = LibC::TimeZone.new
tz.minutes_west = 1
tz.minutes_west #=> 1

value = U::IntOrFloat.new
value.some_int = 1
value.some_int #=> 1
value.some_float #=> 4.94066e-324

X::SomeEnum::One #=> One

LibC.errno #=> some value
LibC.errno = 0
LibC.errno #=> 0

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

