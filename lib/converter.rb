require 'json'
require 'pry'

def read_parse_sym
  title_string = File.read('../data/names.json')
  title_hash = JSON.parse(title_string)
  Hash[title_hash.map{|(k,v)| [k.to_sym,v]}]
end


def run
  puts "Enter Title or Multiple Titles (ex: title, title)"
  user_input = gets.chomp.split(", ").map(&:to_sym)
  puts
  puts "RESULTS:"
  puts

  user_input.each do |title|
    if value = read_parse_sym[title]
      puts "#{value}"
      puts
    else
      puts
      puts "*****Error, #{title} not found!******"
    end
  end
end
