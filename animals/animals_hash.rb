# animal_hash.rb
# Hash of animals

zoo = [ # Array
    { #Hash
        :species => 'lion',
        :count => 4,
        :scientific_name => 'Panthera leo',
        :emoji => '🦁'
    },
    { #Hash
        :species => 'gorillas',
        :count => 9,
        :scientific_name => 'Gorilla beringei beringei',
        :emoji => '🦍'
    },
    { #Hash
        :species => 'dolphin',
        :count => 2,
        :scientific_name => 'Tursiops truncatus',
        :emoji => '🐬'
    },
    { #Hash
        :species => 'octopus',
        :count => 11,
        :scientific_name => 'Octopoda',
        :emoji => '🐙'
    },
    { #Hash
        :species => 'wolf',
        :count => 5,
        :scientific_name => 'Canis lupus',
        :emoji => '🐺'
    }
]

# Loop through each record in the zoo
zoo.each do |record|
    # Transfer values to variables
    species = record[:species]
    scientific_name = record[:scientific_name]
    count = record[:count]
    emoji = record[:emoji]
    
    # Display record
    puts "#{emoji}  #{species} (#{scientific_name}) x #{count}"
end