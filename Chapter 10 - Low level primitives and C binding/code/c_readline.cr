@[Link("readline")]
lib LibReadline
    fun readline(prompt: UInt8*) : Pointer(UInt8)
end

line = LibReadline.readline("What's your name?\n")
p String.new(line)