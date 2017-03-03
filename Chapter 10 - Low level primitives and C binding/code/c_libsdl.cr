@[Link("SDL")]
lib LibSDL
  INIT_TIMER       = 0x00000001_u32
  INIT_AUDIO       = 0x00000010_u32
  # ...
  struct Rect
    x, y : Int16
    w, h : UInt16
  end
  # ...
  # union Event
  #   type : UInt8
  #   key : KeyboardEvent
  # end
  # ...
  fun init = SDL_Init(flags : UInt32) : Int32
end

value = LibSDL.init(LibSDL::INIT_TIMER) 
