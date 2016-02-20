require '../lib/modules'
require 'json'
require 'pry'

class Search
  def initialize

  end
  include Toolbox

  def search_hash
    title_string = File.read('../data/full_subject.json')
    title_hash = JSON.parse(title_string)
    Hash[title_hash.map{|(k, v)| [k.downcase, v]}]
  end

  def start_search
    menu("search")
    user_entry
  end

  def search_results
    puts
    puts "*** Results for Subject Area: #{subject_hash[@choice]} ***"
    puts
    @results = []
    @choice2.each do |word|
      string = word.to_str
      search_hash.map do |(k, v)|
        if v == subject_hash[@choice]
          title = k.to_str
          if title.include? string
            @results << title
          end
        end
      end
    end
  end

  def user_entry
    print "> "
    @choice = gets.chomp.to_i
    case @choice
        when 1..27
        then
          puts
          puts "Please enter words or a word to search. (ex. African American)"
          print "> "
          @choice2 = gets.chomp.downcase.split(" ")
          puts
          puts
          puts "Type \"c\" for comma separated results or \"n\" for new line separated results"
          print "> "
          choice3 = gets.chomp.downcase
            if choice3 == "c"
                search_results
                print @results.uniq.join(", ").to_str
                puts
                puts "*** Search Complete ***"
            elsif choice3 == "n"
                search_results
                 @results.uniq.each {|result| puts result; puts}
                puts
                puts "*** Search Complete ***"
            else
                error
                try_again("searching")
                start_search
            end
          try_again("searching")
          start_search
        end
        error
        start_search
  end
end
