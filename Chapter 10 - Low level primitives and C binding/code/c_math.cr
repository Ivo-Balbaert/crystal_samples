# OS X 
lib LibMath   
  fun nearbyint(x: Float64): Float64
  fun pow(x: Float64, y: Float64): Float64
end

LibMath.nearbyint(3.534) #=> 4.0: Float64
LibMath.pow(2, 10) #=> 1024.0: Float64

# Ubuntu
lib LibM   
  fun nearbyint(x: Float64): Float64
  fun pow(x: Float64, y: Float64): Float64
end

LibM.nearbyint(3.534) #=> 4.0: Float64
LibM.pow(2, 10) #=> 1024.0: Float64

# calling via LibC and linking in mathematical library (ok on Ubuntu):
@[Link("m")] # Math Library
lib LibC
  fun sin(value : Float64) : Float64
  fun cos(value : Float64) : Float64 # from C: double cos(double x)
end
 
y = LibC.sin(2.5)
puts y              # => 0.59847214410395655
p LibC.cos(1.5)     # => 0.0707372 