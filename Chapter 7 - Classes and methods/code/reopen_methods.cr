class A
    def b
        1
    end
end

# can also be written on 1 line as:
# class A; def b; 1; end; end;

class A
    def b
        2
    end
end

A.new.b # => 2