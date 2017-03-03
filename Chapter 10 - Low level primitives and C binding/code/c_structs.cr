# in C have a struct Point defined
# struct Point {
#     int x, y;
# }

# struct Point point;
# point.x = 1;
# point.x = 2;

lib LibC
    struct Point
        x, y : Int32
    end
end

point = LibC::Point.new
point.x = 1
point.y = 2