require '../lib/modules'
require 'pry'
require 'json'

class Browse
  include Toolbox

  def hash(file)
    title_string = File.read(file)
    title_hash = JSON.parse(title_string)
    Hash[title_hash.map{|(k, v)| [k.downcase, v]}]
  end

  def title_size
  puts
  puts "Type \"full\" to view full column names or \"abbv\" for abbreviated column names"
  print "> "
  choice2 = gets.chomp.downcase
  puts
  puts "RESULTS:"
    if choice2 == "abbv"
      hash('../data/abbv_subject.json')
    elsif choice2 == "full"
      hash('../data/full_subject.json')
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
    print "> "
    choice = gets.chomp.to_i
  case choice
      when 1..27
      then
        puts
        puts "Type \"c\" for comma separated results or \"n\" for new line separated results"
        print "> "
        choice3 = gets.chomp.downcase
          if choice3 == "c"
            title_size.map {|(k, v)|
              if v == subject_hash[choice]
                print "#{k.gsub(/ $/, '')}, "
              end}
          elsif choice3 == "n"
            title_size.map {|(k, v)|
              if v == subject_hash[choice]
                puts k.gsub(/ $/, '')
                puts
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
