require_relative '../lib/toolbox'
require 'json'
require 'pry'

class Convert
  include Toolbox
  def start_convert
    puts """Welcome to convert! Which would you like to convert?
    1. An abbreviated column name to a full column name
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
          puts "#{value}"
          puts
        else
          puts
          puts "*****Error, #{title} not found!******"
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
