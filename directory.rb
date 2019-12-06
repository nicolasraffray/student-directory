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
    get_file_name()
    save_students(@filename)
  when "4"
    get_file_name()
    load_students(@filename)
  when "9"
    exit # causes the program to terminate
  else
    puts "I don't know what you meant, please try again"
  end
end

def action_successful
  puts "Your action was successful!"
end

def get_name_from_user()
  @name = STDIN.gets.chomp # this was a much repeated line
end

def fill_students_array
  @students << {name: @name, cohort: :november}
end

def get_file_name()
  puts "Please type the name of the file or enter for default option"
  @filename = STDIN.gets.chomp
  if @filename.empty?
    return
  else
    @filename
  end
end

# 1st Menu item
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  # get the first name
  get_name_from_user()
  # while the name is not empty, repeat this code
  while !@name.empty? do
    fill_students_array()
    puts "Now we have #{@students.count} students"
    action_successful()
    # get another name from the user
    get_name_from_user()
  end
end

# 2nd Menu item
def show_students
  print_header
  print_students_list
  print_footer
  action_successful
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

# 3rd Menu item
def save_students(filename = "students.csv")
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of Students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  action_successful
end

# 4th Menu item
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    fill_students_array()
  end
  file.close
  action_successful
end

# 5th menu item
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
  action_successful
end

interactive_menu()
