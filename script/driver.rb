require_relative '../lib/search'
require_relative '../lib/browse'
require_relative '../lib/convert'
require_relative '../lib/pusheen'
require_relative "../lib/log"

require 'pry'

class Driver
  def self.start
    while true
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
      Log.print "> "
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
        break
      elsif choice == 5
        Pusheen.meow
      else
        Log.puts "*****Error, entry not valid!******"
      end
      Log.puts
      Log.puts "_______________________________________________________"
      Log.puts
      sleep 1.5
    end
  end
end

unless ENV['DEFER_DRIVER']
  Driver.start
end
