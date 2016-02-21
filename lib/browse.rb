require_relative '../lib/toolbox'
require_relative "log"
require 'pry'
require 'json'

class Browse
  include Toolbox
  def title_size
    Log.puts
    Log.puts "Type \"f\" to view full column names or \"a\" for abbreviated column names"
    Log.print "> "
    choice2 = Log.gets.chomp.downcase
    Log.puts
    Log.puts "RESULTS:"
    if choice2 == "a"
      create_hash('../data/abbv_subject.json')
    elsif choice2 == "f"
      create_hash('../data/full_subject.json')
    else
      error
      title_size
    end
  end

  def start_browse
    menu("browse")
    choose
  end

  def choose
    Log.print "> "
    choice = Log.gets.chomp.to_i
    case choice
    when 1..27
      then
      Log.puts
      Log.puts "Type \"c\" for comma separated results or \"n\" for new line separated results"
      Log.print "> "
      choice3 = Log.gets.chomp.downcase
      if choice3 == "c"
        title_size.map {|(k, v)|
          if v == subject_hash[choice]
            Log.print "#{k.downcase.gsub(/ $/, '')}, "
          end}
      elsif choice3 == "n"
        title_size.map {|(k, v)|
          if v == subject_hash[choice]
            Log.puts k.downcase.gsub(/ $/, '')
            Log.puts
          end}
      else
        error
        start_browse
      end
      try_again("browsing")
      start_browse
    end
    error
    choose
  end
end
