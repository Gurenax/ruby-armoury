# emoji_animals.rb
# Displays animal emojis, animal count and their scientific name
# 1. Add emoji to animals
# 2. Display emoji before animal name: 🦍 gorilla x 6
# 3. Add and display scientific name for animals like so: Dolphin (Delphinus)
# 4. Add extra animals with emoji

require 'colorize'

colors = [:light_red, :light_yellow, :light_blue, :light_magenta, :light_cyan, :light_white]

def get_emoji( value )
    case value.downcase.strip
        when 'wolf', /\swolf/
            '🐺'
        when 'gorilla', /\sgorilla/
            '🦍'
        when 'rhino', 'rhinoceros', /\srhino/, /\srhinoceros/
            '🦏'
        when 'owl', /\sowl/
            '🦉'
        when 'lion', /\slion/
            '🦁'
        when 'tiger', /\stiger/
            '🐯'
        when 'octopus', /\soctopus/
            '🐙'
        when 'chicken', /\schicken/
            '🐓'
        when 'dog', /\sdog/
            '🐶'
        when 'eagle', /\seagle/
            '🦅'
        when 'snake', /\ssnake/
            '🐟'
        when 'dolphin', /\sdolphin/
            '🐬'
        when 'unicorn', /\sunicorn/
            '🦄'
        when 'stag', /\stag/
            '🦌'
        else
            '❓'
    end
end

animals = [
    {
        :species => 'wolf',
        :count => 5,
        :scientific_name => 'Canis lupus',
    },
    {
        :species => 'gorilla',
        :count => 9,
        :scientific_name => 'Gorilla beringei beringei',
    },
    {
        :species => 'rhinoceros',
        :count => 3,
        :scientific_name => 'Rhinocerotidae'
    },
    {
        :species => 'owl',
        :count => 12,
        :scientific_name => 'Strigiformes'
    },
    {
        :species => 'lion',
        :count => 4,
        :scientific_name => 'Panthera leo'
    },
    {
        :species => 'tiger',
        :count => 7,
        :scientific_name => 'Panthera tigris'
    },
    {
        :species => 'octopus',
        :count => 11,
        :scientific_name => 'Octopoda'
    },
    {
        :species => 'chicken',
        :count => 50,
        :scientific_name => 'Gallus gallus domesticus'
    },
    {
        :species => 'dog',
        :count => 10,
        :scientific_name => 'Canis lupus familiaris'
    },
    {
        :species => 'bald eagle',
        :count => 2,
        :scientific_name => 'Haliaeetus leucocephalus'
    },
    {
        :species => 'wedge-tailed eagle',
        :count => 4,
        :scientific_name => 'Aquila audax'
    },
    {
        :species => 'white-tailed eagle',
        :count => 6,
        :scientific_name => 'Haliaeetus albicilla'
    },
    {
        :species => 'snake',
        :count => 4,
        :scientific_name => 'Serpentes'
    },
    {
        :species => 'dolphin',
        :count => 12,
        :scientific_name => 'Delphinus'
    },
    {
        :species => 'unicorn',
        :count => 9000,
        :scientific_name => 'Unicornis'
    },
    {
        :species => 'stag',
        :count => '2',
        :scientific_name => 'Cervidae'
    }
]

#animals.sort_by! { |values| values[:species] }
animals.sort_by { |values| values[:species] }.each do |animal|
    puts "#{get_emoji(animal[:species])}  #{animal[:species].capitalize} (#{animal[:scientific_name].capitalize}) x #{animal[:count]}"
    .colorize(:color => colors.sample, :mode => :bold)
end