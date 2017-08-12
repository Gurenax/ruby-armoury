# dnd_character.rb
# Character Creation Class for Dungeons and Dragons
# Rules based on http://media.wizards.com/2016/downloads/DND/PlayerBasicRulesV03.pdf
# 1. Choose a Race
#    - Dwarf
#    - Elf
#    - Halfling
#    - Human
# 2. Choose a Class
#    - Cleric
#    - Fighter
#    - Rogue
#    - Wizard
# 3. Determine Ability Scores
#    - Strength
#    - Dexterity
#    - Constitution
#    - Intelligence
#    - Wisdom
#    - Charisma
# 4. Describe Your Character
#    - Name
#    - Sex
#    - Height
#    - Weight
#    - Languages (by Race)
#    - Alignment (Lawful Good, Neutral Good, Chaotic Good, Lawful Neutral, Neutral, Chaotic Neutral, Lawful Evil, Neutral Evil, Chaotic Evil)
#    - Background (Acolyte, Criminal, Folk Hero, Noble, Sage, Soldier)
#       - Skill Proficiencies
#       - Tool Proficiencies
#       - Equipment
#       - Languages (by Background)
#       - Personality Traits (Choose 2)
#       - Ideals (Choose 1)
#       - Bonds (Choose 1)
#       - Flaws (Choose 1)
#   - Wealth
#       - Clerics/Fighters get 5d4 × 10 gp
#       - Rogues/Wizards get 4d4 × 10 gp
# 5. Choose Your Equipment
#   -
# Other attributes added:
#   - Chracter Level
#   - Experience Points
#   - Character's Height
#   - Proficiency Bonus
#   - Hit Points
#       - Cleric: 8 + CONS modifier
#       - Fighter: 10 + CONS modifier
#       - Rogue: 8 + CONS modifier
#       - Wizard: 6 + CONS modifier
#   - Ability Modifiers

require 'colorize'

class CharacterCreation

    attr_accessor :name
    attr_reader :level, :experience_points, :race, :racial_languages, :character_class,
                :gender, :proficiency_bonus, :hit_points, :appearance, :ability_scores,
                :ability_modifiers, :alignment, :unspent_ability_points


    def initialize(name)
        @name = name
        @level = 1
        @experience_points = 0
        @race = ''
        @racial_languages = ''
        @character_class = ''
        @gender = ''
        @proficiency_bonus = 2
        @hit_points = 0
        @appearance = {
            height: 0,
            weight: 0,
            size: '',
            skin_color: '',
            eye_color: '',
            hair_color: ''
        }
        @unspent_ability_points = 27
        @ability_scores = {
            strength: 8,
            dexterity: 8,
            constitution: 8,
            intelligence: 8,
            wisdom: 8,
            charisma: 8
        }
        @ability_modifiers = {
            strength: -1,
            dexterity: -1,
            constitution: -1,
            intelligence: -1,
            wisdom: -1,
            charisma: -1
        }
        @alignment = ''
    end
    
    # Selects a race
    # Race affects:
    # - Racial Languages
    def select_race(option, race_data)
        id = option - 1
        @race = race_data[id][:name]
        @racial_languages = race_data[id][:languages]
    end

    # Selects a character class
    # Class affects:
    # -
    def select_class(option, class_data)
        id = option - 1
        @character_class = class_data[id]
    end

    # Selects a gender. Gender is a cosmetic stat but it may affect the narrative of the story.
    def select_gender(option, gender_data)
        id = option - 1
        @gender = gender_data[id]
    end

    # Selects your character's size based on height. Small characters have trouble wielding heavy weapons.
    def select_size
        if @appearance[:height] <= 4
            'Small'
        elsif @appearance[:height] >4 and @appearance[:height] <=8
            'Medium'
        else
            'Large'
        end
    end

    # Selects an alignment. Alignment affects the character's personality in the story.
    def select_alignment(option, alignment_data)
        id = option - 1
        @gender = alignment_data[id]
    end

    # Update ability modifiers from race
    def update_ability_modifiers_from_race(race_data)
        # Find Race Index
        race_index = race_data.index{ |race| race[:name] == @race }
        
        # Update new ability modifiers
        @ability_modifiers[:strength] += race_data[race_index][:ability_score_bonus][:strength]
        @ability_modifiers[:dexterity] += race_data[race_index][:ability_score_bonus][:dexterity]
        @ability_modifiers[:constitution] += race_data[race_index][:ability_score_bonus][:constitution]
        @ability_modifiers[:intelligence] += race_data[race_index][:ability_score_bonus][:intelligence]
        @ability_modifiers[:wisdom] += race_data[race_index][:ability_score_bonus][:wisdom]
        @ability_modifiers[:charisma] += race_data[race_index][:ability_score_bonus][:charisma]
    end

    # Allocate racial ability modifiers
    def allocate_ability_score_points(option)
        if @unspent_ability_points > 0
            case option
                when 1
                    @ability_scores[:strength] += 1
                when 2
                    @ability_scores[:dexterity] += 1
                when 3
                    @ability_scores[:constitution] += 1
                when 4
                    @ability_scores[:intelligence] += 1
                when 5
                    @ability_scores[:wisdom] += 1
                when 6
                    @ability_scores[:charisma] += 1
            end
            @unspent_ability_points -= 1
        end
    end
end

character = {
    name: '',
    level: 1,
    experience_points: 0,
    race: '',
    racial_languages: '',
    class: '',
    gender: '',
    proficiency_bonus: 2,
    hit_points: 0,
    appearance: {
        height: 0,
        weight: 0,
        skin_color: '',
        eye_color: '',
        hair_color: '',
    },
    ability_scores: {
        strength: 8,
        dexterity: 8,
        constitution: 8,
        intelligence: 8,
        wisdom: 8,
        charisma: 8
    },
    ability_modifiers: {
        strength: -1,
        dexterity: -1,
        constitution: -1,
        intelligence: -1,
        wisdom: -1,
        charisma: -1
    },
    alignment: '',
    background: {
        skill_proficiencies: '',
        tool_proficiencies: '',
        equipment: '',
        background_languages: '',
        personality_traits: {
            trait1: '',
            trait2: ''
        },
        ideals: '',
        bonds: '',
        flaws: ''
    },
    wealth: {
        gp: 0,
        sp: 0,
        cp: 0
    },
    equipment: ''
}

RACES = [
    {
        name: 'Dwarf',
        languages: 'Common, Dwarvish',
        speed: 25,
        ability_score_bonus: {
            strength: 0,
            dexterity: 0,
            constitution: 2,
            intelligence: 0,
            wisdom: 0,
            charisma: 0
        },
        tool_proficiencies: ['Smith\'s Tools', 'Brewer\'s Supplies', 'Mason\'s Tools']
    },
    {
        name: 'Elf',
        languages: 'Common, Elvish',
        speed: 30,
        ability_score_bonus: {
            strength: 0,
            dexterity: 2,
            constitution: 0,
            intelligence: 0,
            wisdom: 0,
            charisma: 0
        }
    },
    {
        name: 'Halfling',
        languages: 'Common, Halfling',
        speed: 25,
        ability_score_bonus: {
            strength: 0,
            dexterity: 2,
            constitution: 0,
            intelligence: 0,
            wisdom: 0,
            charisma: 0
        }
    },
    {
        name: 'Human',
        languages: 'Common',
        speed: 30,
        ability_score_bonus: {
            strength: 1,
            dexterity: 1,
            constitution: 1,
            intelligence: 1,
            wisdom: 1,
            charisma: 1
        }
    }
]

CLASSES = ['Cleric', 'Fighter', 'Rogue', 'Wizard']

GENDERS = ['Male', 'Female']

ABILITY_SCORES = ['Strength','Dexterity','Constitution','Intelligence','Wisdom','Charisma']

ALIGNMENTS = ['Lawful Good', 'Neutral Good', 'Chaotic Good', 'Lawful Neutral',
            'Neutral', 'Chaotic Neutral', 'Lawful Evil', 'Neutral Evil', 'Chaotic Evil']

# Set dungeon master name
dm_name = "Bruenor"

# Begin character creation narrative
puts "Welcome traveller to a world of dungeons and dragons.".colorize(:color => :light_white)
puts "#{dm_name}: I am #{dm_name}, the dungeon master of this realm.".colorize(:color => :light_cyan)

# Get name from user input
puts "#{dm_name}: What is your name?".colorize(:color => :light_cyan)
print "Name: "
player = DndCharacter.new(gets.chomp)

# # Get race from user input, convert to Integer and validate
# puts "#{dm_name}: Well hello #{player.name}. Which race do you belong to?".colorize(:color => :light_cyan)
# puts "(Please choose a Race by selecting a number)".colorize(:color => :light_white, :mode => :italic)
# begin
#     RACES.each_with_index do |race, index|
#         puts "[#{index+1}] #{race[:name]}".colorize(:color => :light_yellow)
#     end
#     print "Choice: "
#     race_choice = Integer(gets)

#     # Call class method to select a race
#     player.select_race(race_choice, RACES)
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end

# # Get class from user input, convert to Integer and validate
# puts "#{dm_name}: Aha! A mighty #{player.race}! Your adventure has just begun #{player.name}!".colorize(:color => :light_cyan)
# puts "#{dm_name}: So tell me. What type of adventurer are you?".colorize(:color => :light_cyan)
# puts "(Please choose a Class by selecting a number)".colorize(:color => :light_white, :mode => :italic)
# begin
#     CLASSES.each_with_index do |character_class, index|
#         puts "[#{index+1}] #{character_class}".colorize(:color => :light_yellow)
#     end
#     print "Choice: "
#     class_choice = Integer(gets)

#     # Call class method to select a character class
#     player.select_class(class_choice, CLASSES)
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end

# # Get gender from user input, convert to Integer and validate
# puts "#{dm_name}: Very well. It will be a very long journey and it maybe a good time to get to know you better".colorize(:color => :light_cyan)
# puts "#{dm_name}: What is your gender #{player.name}?".colorize(:color => :light_cyan)
# begin
#     GENDERS.each_with_index do |gender, index|
#         puts "[#{index+1}] #{gender}".colorize(:color => :light_yellow)
#     end
#     print "Choice: "
#     gender_choice = Integer(gets)

#     # Call class method to select a gender
#     player.select_gender(gender_choice, GENDERS)
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end

# # Get height and weight from user input, convert to Float and validate
# puts "#{dm_name}: What is your height and weight #{player.name}?".colorize(:color => :light_cyan)
# begin
#     print "Height (in feet): "
#     player.appearance[:height] = Float(gets)
#     # Select character's size based on height
#     player.appearance[:size] = player.select_size
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end
# begin
#     print "Weight (in kilograms): "
#     player.appearance[:weight] = Float(gets)
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end

# puts "#{dm_name}: What is your skin color?".colorize(:color => :light_cyan)
# print "Skin Color: "
# player.appearance[:skin_color] = gets.chomp
# puts "#{dm_name}: What is your eye color?".colorize(:color => :light_cyan)
# print "Eye Color: "
# player.appearance[:eye_color] = gets.chomp
# puts "#{dm_name}: What is your hair color?".colorize(:color => :light_cyan)
# print "Hair Color: "
# player.appearance[:hair_color] = gets.chomp

# # Get alignment from user input, convert to Integer and validate
# puts "#{dm_name}: What is your alignment #{player.name}?".colorize(:color => :light_cyan)
# begin
#     ALIGNMENTS.each_with_index do |alignment, index|
#         puts "[#{index+1}] #{alignment}".colorize(:color => :light_yellow)
#     end
#     print "Choice: "
#     alignment_choice = Integer(gets)

#     # Call class method to select an alignment
#     player.select_alignment(alignment_choice, ALIGNMENTS)
# rescue
#     puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
#     retry
# end

# # Update Ability Modifiers
# player.update_ability_modifiers_from_race(RACES)

# # Allocate Ability Scores
# puts "#{dm_name}: Allocate your ability scores.".colorize(:color => :light_cyan)

while player.unspent_ability_points >= 0
    begin
        puts "Current Total Stength: #{player.ability_scores[:strength]}".colorize(:color => :light_white)
        puts "Current Total Dexterity: #{player.ability_scores[:dexterity]}".colorize(:color => :light_white)
        puts "Current Total Constitution: #{player.ability_scores[:constitution]}".colorize(:color => :light_white)
        puts "Current Total Intelligence: #{player.ability_scores[:intelligence]}".colorize(:color => :light_white)
        puts "Current Total Wisdom: #{player.ability_scores[:wisdom]}".colorize(:color => :light_white)
        puts "Current Total Charisma: #{player.ability_scores[:charisma]}".colorize(:color => :light_white)
        puts ''
        puts "[1] Add 1 point to Strength".colorize(:color => :light_white)
        puts "[2] Add 1 point to Dexterity".colorize(:color => :light_white)
        puts "[3] Add 1 point to Constitution".colorize(:color => :light_white)
        puts "[4] Add 1 point to Intelligence".colorize(:color => :light_white)
        puts "[5] Add 1 point to Wisdom".colorize(:color => :light_white)
        puts "[6] Add 1 point to Charisma".colorize(:color => :light_white)
        puts ''
        puts "Unspent Ability Points: #{player.unspent_ability_points} left".colorize(:color => :light_white)
        puts ''
        if player.unspent_ability_points > 0
            print "Choice: "
            ability_choice = Integer(gets)
        else
            puts "Current Total Stength: #{player.ability_scores[:strength]}".colorize(:color => :light_white)
            puts "Current Total Dexterity: #{player.ability_scores[:dexterity]}".colorize(:color => :light_white)
            puts "Current Total Constitution: #{player.ability_scores[:constitution]}".colorize(:color => :light_white)
            puts "Current Total Intelligence: #{player.ability_scores[:intelligence]}".colorize(:color => :light_white)
            puts "Current Total Wisdom: #{player.ability_scores[:wisdom]}".colorize(:color => :light_white)
            puts "Current Total Charisma: #{player.ability_scores[:charisma]}".colorize(:color => :light_white)
            puts ''
            break;
        end
        # Call class method to allocate ability scores
        player.allocate_ability_score_points(ability_choice)
    rescue
        puts $!.backtrace
        puts "#{dm_name}: That is an invalid option.".colorize(:color => :light_cyan)
        retry
    end
end

# Hit Points



# Display character sheet
#puts character
puts player.name
puts player.level
puts player.experience_points
puts player.race
puts player.racial_languages
puts player.character_class
puts player.gender
puts player.proficiency_bonus
puts player.hit_points
puts player.appearance
puts player.ability_scores
puts player.ability_modifiers
puts player.alignment