# first we print the list of students
# students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Micheal Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
# ]

@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# nothing happens until we call the methods
# students = input_students
# print(students)
# print_footer(students)

# ---- New Exercise ----

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to a csv file"
  puts "4. Load the list form students.csv"
  puts "9. Exit" # 9. bc there will likely be more elements added
end

def show_students
  print_header
  print_students_list
  print_footer
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of Students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
  when "1"
    # input the students
    input_students
  when "2"
    # show the studnets
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # causes the program to terminate
  else
    puts "I don't know what you meant, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
