require '../lib/welcome.rb'
require 'json'
require 'pry'

def read_parse_sym
  title_string = File.read('../data/names.json')
  title_hash = JSON.parse(title_string)
  Hash[title_hash.map{|(k,v)| [k.downcase.to_sym,v.downcase.gsub(/ $/, '').to_sym]}]
end


def convert
  puts """Welcome to convert! Would you like to convert:
  1. An abberviated column name to a full column name
  2. A full column name to an abbreviated column name
  """
  print "> "
  conchoice = gets.chomp.to_i
      if conchoice == 1 || conchoice == 2
        puts "Enter Title or Multiple Titles to convert (ex: title, title)"
        print "> "
        user_input = gets.chomp.split(", ").map(&:to_sym)
        puts
        puts "RESULTS:"
        puts

        if conchoice == 1
          hash = read_parse_sym
        elsif conchoice == 2
          hash = read_parse_sym.invert
        end
          user_input.each do |title|
            if value = hash[title]
              puts "#{value}"
              puts
            else
              puts
              puts "*****Error, #{title} not found!******"
            end
          end
      else
        error
        convert
      end
      go_again
      end



def go_again
puts "Would you like to perform another conversion? (y/n)"
print "> "
choice = gets.chomp.downcase
  if choice == "y"
    puts
    convert
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
