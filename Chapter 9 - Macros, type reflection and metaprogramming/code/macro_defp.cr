# This macro receives a name and a block, which it uses 
# to define a method with the appropriate name and the block’s content as method body.
macro defp(name, &block)
  private def {{name.id}}
    {{block.body}}
  end  
end


# Here we use our macro to define a private method called priv, which we then try to call. 
# As expected this will not compile and we see the usual error message. 
# Calling our private method through a public method of course succeeds, 
# so the method defined via a macro behaves exactly the same way 
# as a method defined in the regular way would.
class Test
  def public
    priv
  end

  defp priv do
    "private method"
  end
end

t = Test.new
# t.priv #=> Error: private method 'priv' called for Test
# same error when protected !
t.public #=> "private method" : String
