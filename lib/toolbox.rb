require_relative "log"

module Toolbox
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

  def error
    Log.puts "*****Error, entry not valid!******"
    Log.puts
  end

  def create_hash(file)
    title_string = File.read(File.join(File.dirname(__FILE__), file))
    JSON.parse(title_string)
  end

  def try_again(action)
    @action = action
    Log.puts
    Log.puts "_______________________________________________________"
    Log.puts "Would you like to continue #{@action}? (y/n)"
    Log.print "> "
    choice = Log.gets.chomp.downcase
    if choice == "y"
      Log.puts
      Log.puts "_______________________________________________________"
    elsif choice == "n"
      Log.puts
      Log.puts "_______________________________________________________"
      Driver.start #<-- TODO, stuff in lib/ shouldn't know about stuff in script/
    elsif choice == "q" || choice == "quit" || choice == "exit"
      exit
    else
      Log.puts "That is not a valid response. Type \"y\", \"n\" or \"exit\" to quit"
      Log.puts
      try_again(action)
    end
  end

  def menu(function)
    @function = function
    Log.puts "Welcome to #{@function}."
    Log.puts "Please type the number corresponding to the subject area you'd like to #{@function}."

    Log.puts """
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
  end
end
