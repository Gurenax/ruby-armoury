# cars.rb

# Challenge
# Create 3 instances of car in an array
# Each car is on empty
# Give each car a different rego and colour
# Loop through each car, print car colour & rego
# Add fuel to car to car 100% full

class Car
    attr_reader :rego, :make, :model, :colour
    attr_accessor :fuel_amount

    def initialize(car)
        @rego = car[:rego]
        @make = car[:make]
        @model = car[:model]
        @colour = car[:colour]
        @fuel_amount = car[:fuel_amount]
    end

end

car1 = {
    rego: 'AAA 111',
    make: 'Subaru',
    model: 'Impreza',
    colour: 'White',
    fuel_amount: 0
}

car2 = {
    rego: 'BBB 222',
    make: 'Toyota',
    model: 'Supra',
    colour: 'Black',
    fuel_amount: 0
}

car3 = {
    rego: 'CCC 333',
    make: 'Lamborghini',
    model: 'Murcielago',
    colour: 'Red',
    fuel_amount: 0
}

# Array of Cars
cars = [Car.new(car1), Car.new(car2), Car.new(car3)]

# Loop each car
cars.each do |car|
    # Display car details
    puts "Registration: #{car.rego}"
    puts "Make and Model: #{car.make} #{car.model}"
    puts "Colour: #{car.colour}"
    puts "Current Fuel Amount: #{car.fuel_amount}%"

    # Add 100% fuel to each car
    car.fuel_amount += 100

    # Display new fuel amount
    puts "New Fuel Amount: #{car.fuel_amount}%"
    puts ''
end