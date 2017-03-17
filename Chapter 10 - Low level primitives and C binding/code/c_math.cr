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