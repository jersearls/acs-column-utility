require '../lib/welcome.rb'
require 'pry'

def subject_hash
  { 1 => "Race", 2 => "Ancestry", 3 => "Foreign Birth",
  4 => "Place of Birth - Native", 5 => "Residence Last Year - Migration",
  6 => "Journey to Work", 7 => "Unweighted Count", 8 => "Children - Relationship",
  9 => "Households - Families", 10 => "Marital Status", 11 => "Fertility",
 12 => "School Enrollment", 13 => "Educational Attainment", 14 => "Age-Sex",
 15 => "Language",
 16 => "Poverty", 17 => "Disability", 18 => "Income", 19 => "Earnings",
 20 => "Veteran Status", 21 => "Transfer Programs",
 22 => "Industry-Occupation-Class of Worker",
 23 => "Housing", 24 => "Group Quarters", 25 => "Health Insurance",
 26 => "Imputations", 27 => "Employment Status"}
end

def abbv_hash
  title_string = File.read('../data/abbv_subject.json')
  title_hash = JSON.parse(title_string)
  Hash[title_hash.map{|(k, v)| [k, v]}]
end




def browse
  puts "Welcome to the browser."
  puts "Please type the number corresponding to the subject area you'd like to view."

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

choose

end

def choose
  print "> "
  choice = gets.chomp.to_i

    case choice
      when 1..27
      then
        if abbv_hash.values.include? subject_hash[choice]
          puts
          puts "RESULTS:"
          abbv_hash.map {|(k, v)|
            if v == subject_hash[choice]
                puts k
            end}
        end
      again

      else

        puts "*****Error, entry not valid!******"
        puts
        choose
    end
    again
end

def again
puts "Would you like to perform another search? (y/n)"
print "> "
choice = gets.chomp.downcase
  if choice == "y"
    puts
    browse
  elsif choice == "n"
    puts
    puts "_______________________________________________________"
    home
  elsif choice == "q" || choice == "quit" || choice == "exit"
    exit
  else
    puts "That is not a valid response. Type \"y\", \"n\" or \"exit\" to quit"
    puts
    again
  end
end
