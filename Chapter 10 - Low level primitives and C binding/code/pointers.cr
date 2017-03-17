ptr = Pointer(UInt8).malloc(20)
ptr.value = 10_u8
puts ptr # => Pointer(UInt8)@0x109303e00

ptr = Pointer(Int32).malloc(1)
p ptr.class # => Pointer(Int32)

# Converting between pointer types
p ptr.as(Int8*)     #:: Pointer(Int8)

# Converting between pointer types and Reference types
array = [1, 2, 3]
# create a pointer with that address
ptr = Pointer(Void).new(array.object_id)
# Now we cast that pointer to the same type, and
# we should get the same value
array2 = ptr.as(Array(Int32))
array2.same?(array) #=> true

# unsafe code
a = 1
ptr = pointerof(a)
ptr.value = 2
puts a # => 2
ptr[100_000] = 2   # undefined behaviour, probably a segmentation fault
