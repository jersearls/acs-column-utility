require '../lib/welcome.rb'
require '../lib/browse.rb'
require 'json'
require 'pry'

def search_again
  puts
  puts "_______________________________________________________"
  puts "Would you like to continue searching? (y/n)"
  print "> "
  choice = gets.chomp.downcase
    if choice == "y"
      puts
      puts "_______________________________________________________"
      search
    elsif choice == "n"
      puts
      puts "_______________________________________________________"
      home
    elsif choice == "q" || choice == "quit" || choice == "exit"
      exit
    else
      puts "That is not a valid response. Type \"y\", \"n\" or \"exit\" to quit"
      puts
      search_again
    end
end

def search_hash
  title_string = File.read('../data/full_subject.json')
  title_hash = JSON.parse(title_string)
  Hash[title_hash.map{|(k, v)| [k.downcase, v.downcase]}]
end

def search
    puts "Welcome to search."
    puts "Please type the number corresponding to the subject area you'd like to search."

    puts """
    1. Race
    2. Ancestry
    3. Foreign Birth
    4. Place of Birth - Native
    5. Residence Last Year - Migration
    6. Journey to Work
    7. Unweighted Count
    8. Children Relationship
    9. Households - Families
    10. Marital Status
    11. Fertility
    12. School Enrollment
    13. Educational Attainment
    14. Age - Sex
    15. Language
    16. Poverty
    17. Disability
    18. Income
    19. Earnings
    20. Veteran Status
    21. Transfer Programs
    22. Industry-Occupation-Class of Worker
    23. Housing
    24. Group Quarters
    25. Health Insurance
    26. Imputations
    27. Employment Status
    """
  user_entry
end

def user_entry
  print "> "
  choice = gets.chomp.to_i
  case choice
      when 1..27
      then
        puts
        puts "Please enter words or a word to search. (ex. African American)"
        print "> "
        choice2 = Regexp.new(gets.chomp)
        puts search_hash.keys.find { |e| choice2 =~ e }

      search_again
  end
  error
  search
end
