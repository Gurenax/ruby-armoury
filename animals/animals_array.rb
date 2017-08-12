# animals_each.rb
# Animal Arrays

# Gem for a Tabled UI for the terminal
require 'terminal-table'

# Gem to Color terminal texts
require 'colorize'

# Array of Animals
animals = ['dog', 'cat', 'moose', 'ostrich', 'emu', 'iguana', 'penguin', 'elephant', 'eagle'];

# Array of Items
rows = []

# Looping through each item of the Array animals
animals.each_with_index do |animal, index|

    # User Visible Index
    user_index = index + 1

    # Color the String (Odd/Even)
    if index % 2 == 0
        colored_index = user_index.to_s.white.bold
        colored_animal = animal.white.bold
    else 
        colored_index = user_index.to_s.yellow.bold
        colored_animal = animal.yellow.bold
    end

    # Add items to rows array
    rows << [colored_index, colored_animal]
end

# Generate and Style the table
table = Terminal::Table.new :headings => ['INDEX'.yellow.on_red.bold, 'ANIMAL'.yellow.on_red.bold],
                            :rows => rows,
                            :style => {:width => 100,
                                       :border_x => "=".red.on_red.bold,
                                       :border_i => "x".red.on_red.bold,
                                       :border_y => "|".red.on_red.bold,
                                       :alignment => :center}

# Output the table
puts table