# Example 1: Closing channels with control channel
jobs = Channel(Int32).new(5)
done = Channel(Bool).new

def foo(done, jobs)
  loop do
    if jobs.closed? && !jobs.empty?
      puts "received job #{jobs.receive}"
    else
      puts "received all jobs"
      done.send true
      return
    end
  end
end

spawn foo(done, jobs)

3.times do |j|
  jobs.send j
  puts "sent job #{j}"
end

jobs.close
puts("sent all jobs")
done.receive   # main is blocked here until fiber foo sends it is done

# Output:
# sent job 0
# sent job 1
# sent job 2
# sent all jobs
# received job 0
# received job 1
# received job 2
# received all jobs

# Example 3: Closing channels using receive?
jobs = Channel(Int32).new(5)

def foo(jobs)
  while item = jobs.receive?   # receive? doesn't give an error when the channel is closed
    puts "received job #{item}"
  end
  puts "received all jobs"
end

spawn do
  3.times do |j|
    jobs.send j
    puts "sent job #{j}"
  end
  puts("sent all jobs")
  jobs.close
end

foo(jobs)

# Output:
# sent job 0
# sent job 1
# sent job 2
# sent all jobs
# received job 0
# received job 1
# received job 2
# received all jobs

# Example 2: receive gives a ChannelClosed error when the channel is closed
# Solution: use receive in a begin rescue block
jobs = Channel(Int32).new(5)

def foo(jobs)
  loop do
    begin
      item = jobs.receive
      puts "received job #{item}"
    rescue
      puts "received all jobs"
      return
    end
  end
end

spawn do
  3.times do |j|
    jobs.send j
    puts "sent job #{j}"
  end
  puts("sent all jobs")
  jobs.close
end

foo(jobs)
# Output:
# sent job 0
# sent job 1
# sent job 2
# sent all jobs
# received job 0
# received job 1
# received job 2
# received all jobs

# Better alternative:
# Example 3: Closing channels using receive?
jobs = Channel(Int32).new(5)

def foo(jobs)
  while item = jobs.receive?   # receive? doesn't give an error when the channel is closed
    puts "received job #{item}"
  end
  puts "received all jobs"
end

spawn do
  3.times do |j|
    jobs.send j
    puts "sent job #{j}"
  end
  puts("sent all jobs")
  jobs.close
end

foo(jobs)

# Output:
# sent job 0
# sent job 1
# sent job 2
# sent all jobs
# received job 0
# received job 1
# received job 2
# received all jobs
