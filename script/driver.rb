require_relative '../lib/search'
require_relative '../lib/browse'
require_relative '../lib/convert'
require_relative '../lib/pusheen'
require_relative "../lib/log"

require 'pry'

class Driver
  def self.start
    Log.puts "Welcome to the Edgewater ACS Census Assistant!"
    Log.puts
    Log.puts "Type the corresponding number to browse available columns,
search column names for keywords or convert selected column names."
    Log.puts """
  1. Browse
  2. Search
  3. Convert
  4. Exit
    """
    print "> "
    choice = Log.gets.chomp.to_i
    if choice == 1
      Log.puts
      Browse.new.start_browse
    elsif choice == 2
      Log.puts
      Search.new.start_search
    elsif choice == 3
      Log.puts
      Convert.new.start_convert
    elsif choice == 4
      exit
    elsif choice == 5
      Pusheen.meow
      start
    else
      Log.puts "Invalid Entry."
      Log.puts
      Log.puts "_______________________________________________________"
      start
    end
  end
end

unless ENV['DEFER_DRIVER']
  Driver.start
end
