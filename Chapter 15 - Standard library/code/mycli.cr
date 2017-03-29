# With just a handful of lines and some other simple code to call this class, 
# a user can mycli -p file.txt, mycli --path file.txt, mycli --path=file.txt, mycli -h and mycli --help
require "option_parser"

class MyCLI
  def run
    path = "./default-path.txt"

    OptionParser.parse! do |parser|
      parser.banner = "Usage mycli [arguments]"

      parser.on("-p PATH", "--path PATH", "Path to a file") do |opt_path|
        path = opt_path
      end

      parser.on("-h", "--help", "Show this help") do
        puts parser
        exit 0
      end
    end

    puts "Your path is #{path}."
  end
end

m = MyCLI.new
m.run