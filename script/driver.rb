require_relative '../lib/search'
require_relative '../lib/browse'
require_relative '../lib/convert'
require_relative '../lib/pusheen'

require 'pry'

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
        Browse.new.start_browse
      elsif choice == 2
        puts
        Search.new.start_search
      elsif choice == 3
        puts
        Convert.new.start_convert
      elsif choice == 4
        exit
      elsif choice == 5
        Pusheen.meow
        home
      else
        puts "Invalid Entry."
        puts
        puts "_______________________________________________________"
        home
      end
end

home
