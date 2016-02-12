require 'json'
require 'pry'

def read_parse
  title_string = File.read('../data/names.json')
  title_hash = JSON.parse(title_string)
end


def run
  full_hash = Hash[read_parse.map{|(k,v)| [k.to_sym,v]}]

  puts "Enter Title or Multiple Titles (ex: title, title)"
  user_input = gets.chomp.split(", ").map(&:to_sym)
  puts
  puts "Results:"

  user_input.each do |title|
    if value = full_hash[title]
      puts "#{value}"
    else
      puts
      puts "*****Error, #{title} not found!******"
    end
  end
end
