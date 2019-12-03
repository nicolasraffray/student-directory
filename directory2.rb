# first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Micheal Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
def input_students
  # create an empty array
  students = []
  name = "x"
  # while the name is not empty, repeat this code
  while true do
    # get another name from the user
    puts "Please enter the names of the students"
    name = gets.chomp
    if !name.empty?
      puts "Please add in a hobby"
      hobby = gets.chomp
      puts "Please add country of birth"
      country = gets.chomp
      students << {name: name, cohort: :november, hobby: hobby,
        birth_nation: country}
      puts "Now we have #{students.count} students"
      puts "Hit enter Once to exit"
    else
      break
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(names)
  names.each{ |x| x.each{ |x,y| puts "#{x}: #{y}".center(30) } }
end

  #names.each_with_index do |student, index|
  #  if student[:name].length < 12
  #    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #  end
  #end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
