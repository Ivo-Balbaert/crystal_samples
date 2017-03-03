require "benchmark"

io = IO::Memory.new

Benchmark.ips do |x|
  x.report("without to_s") do
    io << 123
    io.clear
  end

  x.report("with to_s") do
    io << 123.to_s
    io.clear
  end
end

# Results:
# $ crystal run --release io_benchmark.cr
# without to_s  77.11M ( 12.97ns) (± 1.05%)       fastest
#    with to_s  18.15M ( 55.09ns) (± 7.99%)  4.25× slower