puts "Answer yes(Y) or no(N):"
answer = gets()
loop do
  if answer == "Y"
    puts "you answered Yes!"
    break
  elsif answer == "N"
    puts "you answered No!"
    break
  else
    puts "Answer yes(Y) or no(N):"
    answer = gets()
  end
end
