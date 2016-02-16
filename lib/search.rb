require '../lib/welcome.rb'
require 'json'
require 'pry'

def read_parse_sym
  title_string = File.read('../data/names.json')
  title_hash = JSON.parse(title_string)
  Hash[title_hash.map{|(k,v)| [k.to_sym,v]}]
end


def search
  puts "Welcome to search! Enter Title or Multiple Titles (ex: title, title)"
  print "> "
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
  go_again
end

def go_again
puts "Would you like to perform another search? (y/n)"
print "> "
choice = gets.chomp.downcase
  if choice == "y"
    puts
    search
  elsif choice == "n"
    puts
    puts "_______________________________________________________"
    home
  elsif choice == "q" || choice == "quit" || choice == "exit"
    exit
  else
    puts "That is not a valid response. Type \"y\", \"n\" or \"exit\" to quit"
    puts
    go_again
  end
end
