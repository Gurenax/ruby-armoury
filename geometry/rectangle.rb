# rectangle.rb
# Calculates the area, perimeter, and diagonals of a rectangle

# Formula: Area = width * height
def get_area( width, height )
    return width * height
end

# Formula: Perimeter = 2 * (width + height)
def get_perimeter( width, height )
    return 2.0 * (width + height)
end

# Formula: Diagonal = Square Root of (width^2 + height^2)
def get_diagonal( width, height )
    return Math.sqrt( width ** 2.0 + height ** 2.0 )
end

# Get width string from user input, convert to Float and validate
begin
    print "Enter Width: "
    width = Float(gets)
rescue
    puts "That was an invalid value. Try again."
    retry
end

# Get height string from user input, convert to Float and validate
begin
    print "Enter Height: "
    height = Float(gets)
rescue
    puts "That was an invalid value. Try again."
    retry
end

# Calculate Area
area = get_area(width, height)

# Calculate Perimeter
perimeter = get_perimeter(width, height)

# Calculate Diagonal
diagonal = get_diagonal(width, height)

# Output/display Area to the user
puts "Area #{area.round(3)}"

# Output/display Perimeter to the user
puts "Perimeter: #{perimeter.round(3)}"

# Output/display Diagonal to the user
puts "Diagonal: #{diagonal.round(3)}"