def worker(id, jobs, results)
  while !jobs.closed? || !jobs.empty?
    j = jobs.receive
    puts "worker #{id} processing job #{j}"
    sleep 1
    results.send j*2
  end
end

jobs = Channel(Int32).new(10)
results = Channel(Int32).new(10)

(1..3).each do |w|
  spawn worker(w, jobs, results)
end

(1..9).each do |j|
  jobs.send j
end

jobs.close

9.times do
  p results.receive
end

# Output:
# worker 1 processing job 1
# worker 2 processing job 2
# worker 3 processing job 3
# worker 1 processing job 4
# 2
# worker 2 processing job 5
# 4
# worker 3 processing job 6
# 6
# worker 1 processing job 7
# 8
# worker 2 processing job 8
# 10
# worker 3 processing job 9
# 12
# 14
# 16
# 18