# emoji_methods.rb
# Display emoji using methods

# Exercise:
# 1. Add more emoji
# 2. Handle if the user enters Owl or OWL
# 3. Handle if the user enter '      OWL      '
# 4. Handle if the user enter '    wedge-tailed eagle     '
# 5. Handle if the user enters rhino or rhinoceros

def emoji_for_species(string)
    case string.downcase.strip
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
        when 'human', /\shuman/
            '👮‍'
        when 'eagle', /\seagle/
            '🦅'
        when 'fish', /\sfish/
            '🐟'
        when 'unicorn', /\sunicorn/
            '🦄'
        else
            '❓'
    end
end

print 'Please enter a species: '
species = gets

puts emoji_for_species(species)