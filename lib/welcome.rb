require '../lib/search.rb'
require '../lib/browse.rb'
require '../lib/convert.rb'

def error
  puts "*****Error, entry not valid!******"
  puts
end

def home
  puts "Welcome to the Edgewater ACS Census Assistant!"
  puts
  puts "Type the corresponding number to browse available columns,
search column names for keywords or convert selected column names."
  puts """
  1. Browse
  2. Search
  3. Convert
  4. Exit
  """
  print "> "
  choice = gets.chomp.to_i
      if choice == 1
        puts
        browse
      elsif choice == 2
        puts
        search
      elsif choice == 3
        puts
        convert
      elsif choice == 4
        exit
      elsif choice == 5
        pusheen
        home
      else
        puts "Invalid Entry."
        puts
        puts "_______________________________________________________"
        home
      end
end
