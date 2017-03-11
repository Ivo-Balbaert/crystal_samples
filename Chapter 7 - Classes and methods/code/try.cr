class Try
  def undefined
    print_x
  end

  def defined
    @x = 1
    print_x
  end

  def print_x
    @x.try do |x|
      puts "x is defined and its value is #{x}"
    end
  end
end

try = Try.new
try.undefined  # no error!
try.defined    # => x is defined and its value is 1