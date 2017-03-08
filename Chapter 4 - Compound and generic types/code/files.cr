class FileClass
  def initialize
    puts "__FILE__: #{__FILE__}"
    puts "__DIR__: #{__DIR__}"
  end
end

FileClass.new

# Output:
# __FILE__: /home/ivo/crystal_examples/files.cr
# __DIR__: /home/ivo/crystal_examples
