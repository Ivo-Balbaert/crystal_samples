puts File.read("./reading-files.cr")

f = File.read_lines("./reading-files.cr")

# read a file encoded in e.g. GB2312
File.read("file.txt", encoding: "GB2312")

# Write a string encoded in GB2312 in memory
# encoding can be set on all IOs (files, sockets, pipes, memory):
io = MemoryIO.new
io.set_encoding "GB2312"
io.print "你好"

# See the resulting bytes
io.rewind
puts io.to_slice # => [196, 227, 186, 195]
