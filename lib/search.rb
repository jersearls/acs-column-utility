require '../lib/modules'
require 'json'
require 'pry'

class Search
  include Toolbox
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
