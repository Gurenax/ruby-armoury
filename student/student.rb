#student.rb
# 1. Add your own classes to the Student / Course example (edited)
# e.g. Teacher, Hobby, Contact, Subject
# 2. Allow students to enrol in multiple courses by changing `course` of student to a `courses` array instead
# 3. Add a `students` attribute to `Course`, and automatically connect the two when a student has its `courses` changed

require 'date' # Allow us to use the Date class
require 'colorize'

class Student
# Student
# - first_name: String
# - last_name: String
# - country_of_birth: String
# = courses: array of Courses
# - birthday: Date
# - age: Integer (Calculated: Date Today minus birthday)
# - phone_number: String
# - email: String
# - address: Address
# - enrolment_type: String (Domestic or International)
# - total_fees: Integer (Calculated)

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        # Need to initialize the Courses array
        @courses = Array.new
    end

    # Define getters and setters the fast way
    attr_accessor :first_name, :last_name, :country_of_birth, :courses, :birthday, :phone_number, :email, :address, :enrolment_type

    # Calculate Age
    def age
        # Get date today
        date_today = Date.today
        # Calculate age (Supports leap years)
        age = date_today.year - birthday.year - ((date_today.month > birthday.month || (date_today.month == birthday.month && date_today.day >= birthday.day)) ? 0 : 1)
    end

    # Add a Course to Student
    # Update the Course list of Students
    def add_course(course)
        course.add_student(self)
        @courses << course unless @courses.include?(course) # Add the course unless it's already there
    end

    # Remove a Course from Student
    # Update the Course list of Students
    def remove_course(course)
        course.remove_student(self)
        @courses.delete(course)
    end

    # Get total Course fees on all enroled courses
    def total_fees
        total_fees = 0
        courses.each do |course|
            # Add total fees (while checking if the student is a Domestic or International student)
            total_fees += self.enrolment_type == 'Domestic' ? course.domestic_cost : course.international_cost            
        end
        total_fees
    end
end

class Course
# Course
# - name: String
# - course_code: String
# - start_date: Date
# - month_count: Integer
# - end_date: Date (Calculated start_date + no. of months)
# - teacher: String
# - domestic_cost: Float
# - international_cost: Float
# - students: array of Students
# - address: Address
    attr_accessor :name, :course_code, :start_date, :month_count, :teacher, :domestic_cost, :international_cost, :students, :address

    def initialize
        # Need to initialize the Students array
        @students = Array.new
    end

    # Get End Date of Course
    def end_date
        start_date = @start_date
        start_date.next_month(@month_count) # Advance by no. of months
    end

    # Add a Student to the Course
    def add_student(student)
        @students << student unless @students.include?(student) # Add the student unless it's already there
    end

    # Remove a Student from the Course
    def remove_student(student)
        @students.delete(student)
    end

end

class Address
# Address
# - street: String
# - suburb: String
# - state: String
# - postal_code: Integer
# - country: String
    attr_accessor :street, :suburb, :state, :postal_code, :country

    def get_full_address
        "#{self.street}, #{self.suburb}, #{self.state} #{self.postal_code} #{self.country}"
    end
end

#### COURSES ####
fast_track = Course.new
fast_track.name = 'Diploma of IT'
fast_track.course_code = 'FT004'
fast_track.start_date = Date.new(2017, 9, 1)
fast_track.month_count = 6
fast_track.teacher = 'Patrick Smith'
fast_track.domestic_cost = 19700.00
fast_track.international_cost = 24950.00
fast_track_address = Address.new
fast_track_address.street = '120 Spencer St'
fast_track_address.suburb = 'Melbourne'
fast_track_address.state = 'VIC'
fast_track_address.postal_code = '3000'
fast_track_address.country = 'Australia'
fast_track.address = fast_track_address

business = Course.new
business.name = 'Diploma of Business'
business.course_code = 'BS001'
business.start_date = Date.new(2017, 10, 1)
business.month_count = 3
business.teacher = 'John Smith'
business.domestic_cost = 10000.50
business.international_cost = 12000.00
business_address = Address.new
business_address.street = '121 Spencer St'
business_address.suburb = 'Melbourne'
business_address.state = 'VIC'
business_address.postal_code = '3000'
business_address.country = 'Australia'
business.address = business_address

engineering = Course.new
engineering.name = 'Diploma of Engineering'
engineering.course_code = 'EG002'
engineering.start_date = Date.new(2017, 9, 1)
engineering.month_count = 2
engineering.teacher = 'Sam Smith'
engineering.domestic_cost = 2500.00
engineering.international_cost = 4950.00
engineering_address = Address.new
engineering_address.street = '122 Spencer St'
engineering_address.suburb = 'Melbourne'
engineering_address.state = 'VIC'
engineering_address.postal_code = '3000'
engineering_address.country = 'Australia'
engineering.address = engineering_address

#### MARY POPPINS ####
mary = Student.new('Mary', 'Poppins')
print "First Name: "
puts mary.first_name
print "Last Name: "
puts mary.last_name

print "Country of Birth: "
mary.country_of_birth='New Zealand'
puts mary.country_of_birth

puts "#{mary.first_name} enroled in #{fast_track.name}".light_white.bold
mary.add_course(fast_track)
puts "#{mary.first_name} enroled in #{business.name}".light_white.bold
mary.add_course(business)
puts "#{mary.first_name} enroled in #{engineering.name}".light_white.bold
mary.add_course(engineering)

marys_courses = mary.courses
marys_courses.each do |marys_course|
    puts "#{mary.first_name}'s #{marys_course.name} course end on: #{marys_course.end_date}"
end

mary.birthday = Date.new(1880, 8, 7)
mary.phone_number = '0412345678'
mary.email = 'mary.poppins@gmail.com'
puts "#{mary.first_name}\'s birthday: #{mary.birthday}"
puts "#{mary.first_name}\'s age: #{mary.age}"
puts "#{mary.first_name}\'s phone: #{mary.phone_number}"
puts "#{mary.first_name}\'s email: #{mary.email}"

### Mary's Address ###
marys_address = Address.new
marys_address.street = '120 Spencer St'
marys_address.suburb = 'Melbourne'
marys_address.state = 'VIC'
marys_address.postal_code = '3000'
marys_address.country = 'Australia'
mary.address = marys_address
puts "#{mary.first_name}\'s address: #{marys_address.get_full_address}"

mary.enrolment_type = 'Domestic'
puts "#{mary.first_name}'s total course fees: #{mary.total_fees}"

puts ''

#### DONALD BRADMAN ####
don = Student.new('Donald', 'Bradman')
print "First Name: "
puts don.first_name
print "Last Name: "
puts don.last_name

print "Country of Birth: "
don.country_of_birth='Australia'
puts don.country_of_birth

puts "#{don.first_name} enroled #{fast_track.name}".light_white.bold
don.add_course(fast_track)
puts "#{don.first_name} enroled #{business.name}".light_white.bold
don.add_course(business)

dons_courses = don.courses
dons_courses.each do |dons_course|
    puts "#{don.first_name}'s #{dons_course.name} course end on: #{dons_course.end_date}"
end

don.birthday = Date.new(1990, 6, 1)
don.phone_number = '0422222222'
don.email = 'donald.bradman@gmail.com'
puts "#{don.first_name}\'s birthday: #{don.birthday}"
puts "#{don.first_name}\'s age: #{don.age}"
puts "#{don.first_name}\'s phone: #{don.phone_number}"
puts "#{don.first_name}\'s email: #{don.email}"

### Donald's Address ###
dons_address = Address.new
dons_address.street = '100 Bourke St'
dons_address.suburb = 'Melbourne'
dons_address.state = 'VIC'
dons_address.postal_code = '3000'
dons_address.country = 'Australia'
don.address = dons_address
puts "#{don.first_name}\'s address: #{dons_address.get_full_address}"

don.enrolment_type = 'International'
puts "#{don.first_name}'s total course fees: #{don.total_fees}"
puts ''


#### Check if Mary and Don have the same courses
print 'Mary and Don have the same Course? : '
mary_and_don_have_same_course = mary.courses == don.courses

if mary_and_don_have_same_course
    puts "Same"
else
    puts "Different"
end

puts ''
# Remove Business Course from Mary
puts "#{mary.first_name} unenroled #{business.name}".light_white.bold
mary.remove_course(business)
# Add Engineer Course to Don
puts "#{don.first_name} enroled #{engineering.name}".light_white.bold
don.add_course(engineering)

### Display all students enroled in a certain course ###
puts ''
puts "Students enroled in #{fast_track.name}"
fast_track_students = fast_track.students
fast_track_students.each do |student|
    puts "#{student.first_name} #{student.last_name}"
end

puts ''
puts "Students enroled in #{business.name}"
business_students = business.students
business_students.each do |student|
    puts "#{student.first_name} #{student.last_name}"
end

puts ''
puts "Students enroled in #{engineering.name}"
engineering_students = engineering.students
engineering_students.each do |student|
    puts "#{student.first_name} #{student.last_name}"
end

puts ''
puts "#{mary.first_name} and #{don.first_name}\'s updated course fees:"
puts "#{mary.first_name}'s total course fees: #{mary.total_fees}"
puts "#{don.first_name}'s total course fees: #{don.total_fees}"

puts ''
puts "#{fast_track.name} course held at #{fast_track_address.get_full_address}"
puts "#{business.name} course held at #{business_address.get_full_address}"
puts "#{engineering.name} course held at #{engineering_address.get_full_address}"