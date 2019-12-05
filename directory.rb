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

# nothing happens until we call the methods
# students = input_students
# print(students)
# print_footer(students)

# ---- New Exercise ----
def interactive_menu
  load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to a csv file"
  puts "4. Load the list form students.csv"
  puts "5. Load Data as arguement from command line"
  puts "9. Exit" # 9. bc there will likely be more elements added
end

def process(selection)
  case selection
  when "1"
    # input the students
    input_students()
  when "2"
    # show the studnets
    show_students()
  when "3"
    save_students()
  when "4"
    load_students()
  when "9"
    exit # causes the program to terminate
  else
    puts "I don't know what you meant, please try again"
  end
end

def fill_students_array
  @students << {name: @name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    fill_students_array()
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    fill_students_array()
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first arguement from the command line
  return if filename.nil? # exit the method if the file name doesn't exist
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't esixt."
    exit
  end
end

interactive_menu()
