table = Hash(String, Array(String)).new { |h, k|
  h[k] = [] of String
}
File.each_line("/usr/share/dict/words") do |line|
  word = line.chomp
  key = word.downcase.chars.sort.join
  table[key] << word
end
word = ARGV[0].downcase
anagrams = table[word.chars.sort.join]
anagrams.map!(&.downcase)
anagrams.delete(word)
if anagrams.any?
  puts "Anagrams for '#{word}': #{anagrams.join(", ")}"
else
  puts "Sorry, no anagrams for '#{word}'"
end
