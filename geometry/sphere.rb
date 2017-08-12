# sphere.rb
# Calculates the Circumference, Area and Volume of a Sphere

# Formula: Circumference = pi * diameter
def get_circumference( diameter )
    return Math::PI * diameter
end

# Forumla: Radius = diameter / 2
def get_radius( diameter )
    return diameter / 2.0
end

# Formula: Area = pi * r * r
def get_area( radius )
    return Math::PI * radius * radius
end

# Formula: Volume = 4/3 * pi * r^3
def get_volume( radius )
    return (4.0 / 3.0) * Math::PI * (radius ** 3.0)
end

# Get diameter string from user input, convert to Float and validate
begin
    print "Enter Diameter: "
    diameter = Float(gets)
rescue
    puts "That was an invalid value. Try again."
    retry
end

# Calculate Circumference
circumference = get_circumference(diameter)

# Calculate Radius
radius = get_radius(diameter)

# Calculate Area
area = get_area(radius)

# Calculate Volume
volume = get_volume(radius)

# Output/display to the user
puts "Circumference: #{circumference.round(3)}"

# Output/display to the user
puts "Area: #{area.round(3)}"

# Output/display to the user
puts "Volume: #{volume.round(3)}"