people = [
    {
        first_name: 'Sally', #Susan
        last_name: 'Chan',
        blood_type: 'O-',
        gender: 'female',
        dob: '26th January 1983',
        residence: {
            street: '120 Spencer Street',
            city: 'Melbourne',
            state: 'Victoria'
        }
    },
    {
        first_name: 'Alex',
        last_name: 'Palma',
        blood_type: 'B+',
        gender: 'male',
        dob: '8th May 1987',
        residence: {
            street: 'Unit 17, 50 Spencer Street',
            city: 'Melbourne',
            state: 'Victoria'
        } 
    }
]

# I want all the people's first name printed on the screen
# I want to put the people in an array

def get_first_name(person)
    first_name = person[:first_name]
    first_name
end

def set_first_name(person, name)
    person[:first_name] = name.capitalize
end

#Challenge
# Write the full name of each person out to screen
# Use a method (get) and loop over both people
# Answer 1
def get_full_name_of_everyone(people)
    people.each do |person|
        puts "#{person[:first_name]} #{person[:last_name]}"
    end
end
# Answer 2
def get_full_name(person)
    "#{person[:first_name]} #{person[:last_name]}"
end

# Display person's first name
people.each do |person|
    puts "The person's name is #{get_first_name(person)}"
end

# Change Sally's name
set_first_name(people[0], 'SUSAN')
susan = people[0]
puts susan[:first_name]

# Display every person's full name
get_full_name_of_everyone(people)

# Display every person's full name in a different way
people.each do |person|
    puts get_full_name(person)
end