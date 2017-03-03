@[Link("pcre")]
lib LibPCRE
# a constant
  INFO_CAPTURECOUNT = 2
  fun compile = pcre_compile(pattern : UInt8*, options : Int,
      errptr : UInt8**, erroffset : Int*, tableptr : Void*) : Pcre
end

PCRE::INFO_CAPTURECOUNT #=> 2
# LibPCRE.compile()
