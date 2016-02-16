require '../lib/search.rb'
require '../lib/browse.rb'

def home
  puts "Welcome to Edgewater ACS Census Assistant!"
  puts
  puts "Would you like to browse existing hive tables or search for a full column name?"
  puts "Type \"search\" or \"browse\" to get started, or type \"exit\" to quit."
  print "> "
  choice = gets.chomp.downcase
      if choice == "browse" || choice == "b"
        puts
        browse
      elsif choice == "search" || choice == "s"
        puts
        search
      elsif choice == "q" || choice == "quit" || choice == "exit"
        exit
      else
        puts "Invalid Entry."
        puts
        puts "_______________________________________________________"
        home
      end
end
