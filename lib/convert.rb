require_relative '../lib/toolbox'
require_relative "log"
require 'json'
require 'pry'

class Convert
  include Toolbox
  def start_convert
    Log.puts """Welcome to convert! Which would you like to convert?
    1. An abbreviated column name to a full column name
    2. A full column name to an abbreviated column name
    """
    Log.print "> "
    conchoice = Log.gets.chomp.to_i
    if conchoice == 1 || conchoice == 2
      Log.puts "Enter Title or Multiple Titles to convert (ex: title, title)"
      Log.print "> "
      user_input = Log.gets.chomp.split(", ").map(&:to_sym)
      Log.puts
      Log.puts "RESULTS:"
      Log.puts
      col_name_hash = Hash[create_hash('../data/names.json').map do
        |(k,v)| [k.downcase.to_sym,v.downcase.gsub(/ $/, '').to_sym]
      end]
      if conchoice == 1
        hash = col_name_hash
      elsif conchoice == 2
        hash = col_name_hash.invert
      end
      user_input.each do |title|
        if value = hash[title]
          Log.puts "#{value}"
          Log.puts
        else
          Log.puts
          Log.puts "*****Error, #{title} not found!******"
        end
      end
    else
      error
      start_convert
    end
    try_again("converting column names")
    start_convert
  end
end
