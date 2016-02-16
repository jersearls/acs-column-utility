require '../lib/search.rb'
require '../lib/browse.rb'

def home
  puts "Welcome to Edgewater ACS Census Assistant!"
  puts
  puts "Would you like to browse existing hive tables or search for a full column name?"
  puts "Type search or browse to get started."
    choice = gets.chomp.downcase
      if choice == "browse"
        browse
      elsif choice == "search"
        search
      end
end
