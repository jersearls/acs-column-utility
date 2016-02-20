require '../lib/modules'
require 'json'
require 'pry'

class Convert
  include Toolbox
  def read_parse_sym
    title_string = File.read('../data/names.json')
    title_hash = JSON.parse(title_string)
    Hash[title_hash.map{|(k,v)| [k.downcase.to_sym,v.downcase.gsub(/ $/, '').to_sym]}]
  end
  def start_convert
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
        start_convert
      end
    try_again("conversion")
    start_convert
  end


end
