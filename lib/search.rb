require_relative '../lib/toolbox'
require_relative "log"
require 'json'
require 'pry'

class Search
  include Toolbox
  def start_search
    menu("search")
    user_entry
  end

  def search_results
    Log.puts
    Log.puts "*** Results for Subject Area: #{subject_hash[@choice]} ***"
    Log.puts
    @results = []
    @choice2.each do |word|
      search_entry = word.to_str
      create_hash('../data/full_subject.json').map do |(k, v)|
        if v == subject_hash[@choice]
          title = k.downcase.to_str
          if title.include? search_entry
            @results << title
          end
        end
      end
    end
    @results.uniq!
  end

  def result_count
    Log.puts
    Log.puts "*** Search Complete: #{@results.length} Results Found ***"
    Log.puts "_______________________________________________________"
  end

  def user_entry
    Log.print "> "
    @choice = Log.gets.chomp.to_i
    case @choice
    when 1..27
      then
      Log.puts
      Log.puts "Please enter words or a word to search. (ex. African American)"
      Log.print "> "
      @choice2 = Log.gets.chomp.downcase.split(" ")
      Log.puts
      Log.puts
      Log.puts "Type \"c\" for comma separated results or \"n\" for new line separated results"
      Log.print "> "
      choice3 = Log.gets.chomp.downcase
      if choice3 == "c"
        search_results
        Log.print @results.join(", ").to_str
        Log.puts
        result_count
      elsif choice3 == "n"
        search_results
        @results.each {|result| Log.puts result; Log.puts}
        result_count
      else
        error
      end
    else
      error
    end
  end
end
