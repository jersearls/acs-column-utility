
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
    puts "*****Error, entry not valid!******"
    puts
  end

  def try_again(action)
    @action = action
    puts
    puts "_______________________________________________________"
    puts "Would you like to continue #{@action}? (y/n)"
    print "> "
    choice = gets.chomp.downcase
      if choice == "y"
        puts
        puts "_______________________________________________________"
      elsif choice == "n"
        puts
        puts "_______________________________________________________"
        home
      elsif choice == "q" || choice == "quit" || choice == "exit"
        exit
      else
        puts "That is not a valid response. Type \"y\", \"n\" or \"exit\" to quit"
        puts
        try_again
      end
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

  def menu(function)
    @function = function
    puts "Welcome to #{@function}."
    puts "Please type the number corresponding to the subject area you'd like to #{@function}."

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
  end

end

module Pusheen
  def self.meow

    puts """
                \"MEOW!\"
    ───────────────────────────────────────
    ───▐▀▄───────▄▀▌───▄▄▄▄▄▄▄─────────────
    ───▌▒▒▀▄▄▄▄▄▀▒▒▐▄▀▀▒██▒██▒▀▀▄──────────
    ──▐▒▒▒▒▀▒▀▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄────────
    ──▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▒▒▒▒▒▒▒▒▀▄──────
    ▀█▒▒▒█▌▒▒█▒▒▐█▒▒▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌─────
    ▀▌▒▒▒▒▒▒▀▒▀▒▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐───▄▄
    ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌▄█▒█
    ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒█▀─
    ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▀───
    ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌────
    ─▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐─────
    ─▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌─────
    ──▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐──────
    ──▐▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▌──────
    ────▀▄▄▀▀▀▀▀▄▄▀▀▀▀▀▀▀▄▄▀▀▀▀▀▄▄▀────────
    """

  end

end
