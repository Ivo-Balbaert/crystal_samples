def not_nil(exp)
  if exp.is_a?(Nil)
    raise "oops, nil"
  else
    exp
  end
end

class Array
  def compact
    result = Array(typeof(not_nil(self[0]))).new
    each do |element|
      result << element unless element.is_a?(Nil)
    end
    result
  end
end

arr = [nil, 1, nil, 2, nil, 3]
puts typeof(arr) # => Array(Int32 | Nil)

compacted = arr.compact
puts compacted         # => [1, 2, 3]
puts typeof(compacted) # => Array(Int32)

# how does this work if first element is nil?
