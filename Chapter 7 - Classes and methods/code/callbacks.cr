class Foo
  def initialize
    @callbacks = [] of ->
  end

  def after_save(&block)
    @callbacks << block
  end

  def save
    @callbacks.each &.call
  end
end

foo = Foo.new
foo.after_save { puts 1 }
foo.after_save { puts 2 }
foo.save # => 1  2