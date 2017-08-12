# sphere.rb
# Calculates the Circumference, Area and Volume of a Sphere

pi = 3.14159265359
print 'Enter Diameter: '

# Get string from the user
input = gets.chomp

# Convert to float
diameter = input.to_f

# Circumference Formula: pi * diameter
circumference = pi * diameter

# Radius Forumla: diameter / 2
radius = diameter / 2.0

# Area Formula: pi * r * r
area = pi * radius * radius

# Volume Formula:  4/3 * pi * r^3
volume = (4.0 / 3.0) * pi * (radius ** 3.0)

# Output/display to the user
print 'Circumference: '
puts circumference.round(3)

# Output/display to the user
print 'Area: '
puts area.round(3)

# Output/display to the user
print 'Volume: '
puts volume.round(3)