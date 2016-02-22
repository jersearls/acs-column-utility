require_relative '../lib/toolbox'
require_relative "log"
require 'pry'
require 'json'

class Browse
  include Toolbox
  def initialize
    @results = []
  end

  def hash_map(file)
    create_hash(file).map do |(k, v)|
      if v == subject_hash[@choice]
        @results << k.downcase.gsub(/ $/, '')
      end
    end
  end

  def title_size
      Log.puts
      Log.puts "Type \"f\" to view full column names or \"a\" for abbreviated column names"
      Log.print "> "
      choice2 = Log.gets.chomp.downcase
      if choice2 == "a"
        hash_map('../data/abbv_subject.json')
      elsif choice2 == "f"
        hash_map('../data/full_subject.json')
      else
        error
      end
  end

  def start_browse
    menu("browse")
    Log.print "> "
    @choice = Log.gets.chomp.to_i
    case @choice
    when 1..27
      then
      Log.puts
      Log.puts "Type \"c\" for comma separated results or \"n\" for new line separated results"
      Log.print "> "
      choice3 = Log.gets.chomp.downcase
        if choice3 == "c"
          title_size
          Log.puts
          Log.puts "RESULTS:"
          Log.print @results.uniq.join(", ").to_str
          Log.puts
        elsif choice3 == "n"
          title_size
          Log.puts
          Log.puts "RESULTS:"
          @results.uniq.each {|result| Log.puts result; Log.puts}
          Log.puts
        else
          error
        end
    else
      error
    end
    Log.puts "_______________________________________________________"
    Log.puts
  end
end
