require 'json'
require 'pry'

def read_parse
title_string = File.read('../data/temp.json')
title_hash = JSON.parse(title_string)
end

puts "Enter Title or Multiple Titles (ex: title, title)"
input_title = gets.chomp.split(", ").map(&:to_sym)

hash = Hash[read_parse.map{|(k,v)| [k.to_sym,v]}]

puts
puts "Results:"

input_title.each { |title|
if value = hash[title]
  puts "#{value}"
else
  puts
  puts "*****Error, #{title} not found!******"
end
}
