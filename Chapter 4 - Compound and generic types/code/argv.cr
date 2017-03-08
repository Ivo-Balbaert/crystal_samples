# Demo of command line arguments
# ARGV[0]: First command line argument
# (not the executable name)
# ARGV is an array of strings
puts "Number of command line arguments: #{ARGV.size}"
ARGV.each_with_index {|arg, i| puts "Argument #{i}: #{arg}"}

# The executable name is available as PROGRAM_NAME
puts "Executable name: #{PROGRAM_NAME}"

# crystal build argv.cr
# ./argv a b 3
# Number of command line arguments: 3
# Argument 0: a
# Argument 1: b
# Argument 2: 3
# Executable name: ./argv 