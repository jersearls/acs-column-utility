require 'json'
require 'pry'

def read_parse
title_string = File.read('../data/temp.json')
title_hash = JSON.parse(title_string)
end

puts "Enter title:"
input_title = gets.chomp.to_sym

hash = Hash[read_parse.map{|(k,v)| [k.to_sym,v]}]

if value = hash[input_title]
  puts "#{value}"
else
  puts "Error, #{input_title} not found!"
end
