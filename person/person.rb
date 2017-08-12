# person.rb
# Classes, methods, attributes

class Person
    
    # attr_reader :first_name, :last_name, :age
    # attr_writer :age
    attr_accessor :first_name, :last_name, :age

    def initialize(person)
        @first_name = person[:first_name]
        @last_name = person[:last_name]
        @age = person[:age]
        @credit_card = person[:credit_card]
    end

    # def get_first_name
    #     @first_name
    # end

    # def get_last_name
    #     @last_name
    # end

    # def get_age
    #     @age
    # end

    def full_name_please
        get_full_name
    end

    private

    def get_full_name
        "#{@first_name} #{@last_name}"
    end

    def full_name_please2
        get_full_name
    end

    # def set_age(age)
    #     @age = age
    # end
end

person = {
        first_name: 'Sally',
        last_name: 'Chan',
        blood_type: 'O-',
        gender: 'female',
        dob: '26th January 1983',
        credit_card: '234234234234',
        residence: {
            street: '120 Spencer Street',
            city: 'Melbourne',
            state: 'Victoria'
        }
    }

sally = Person.new(person)
#alex = Person.new('Alex', 'Palma', 30, '')

# Display first name and age of Sally
#puts sally.get_first_name
#puts sally.get_age

# Display first name and age of Alex
#puts alex.get_first_name
#puts alex.get_age

# Display full name
#puts sally.get_full_name
#puts alex.get_full_name
puts sally.full_name_please
#puts alex.full_name_please2

# Set age of Alex
#alex.set_age(31)
sally.age = 31

# Display age of Alex
#puts alex.get_age
puts sally.age

# Display Alex's first name and last name
puts sally.first_name
puts sally.last_name