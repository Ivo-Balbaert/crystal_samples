module Moo
  def foo
    1
  end
end

class Foo
  def foo
    2
  end
end

class Bar < Foo
  include Moo
end

class Baz < Bar
end

Baz.new.foo #=> 1  # foo from module Moo is called