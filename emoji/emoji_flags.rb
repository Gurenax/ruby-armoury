# emoji_flags.rb

# 1. Create a new method to String for .flag_emoji
#    e.g. 'au'.flag_emoji would output '🇦🇺',
#    'fr'.flag_emoji would output '🇫🇷',
#    'us'.flag_emoji would output '🇺🇸'
# 2. Add a method to replace all occurences of
#    e.g. 'au' in a String with its flag emoji

require 'colorize'

$COUNTRIES = [
    {
        :name  => 'Australia',
        :code  => 'au',
        :emoji => '🇦🇺'
    },
    {
        :name  => 'France',
        :code  => 'fr',
        :emoji => '🇫🇷'
    },
    {
        :name  => 'United States of America',
        :code  => 'us',
        :emoji => '🇺🇸'
    },
    {
        :name  => 'Philippines',
        :code  => 'ph',
        :emoji => '🇵🇭'
    },
    {
        :name  => 'Brazil',
        :code  => 'br',
        :emoji => '🇧🇷'
    },
    {
        :name  => 'Italy',
        :code  => 'it',
        :emoji => '🇮🇹'
    },
    {
        :name  => 'United Kingdom',
        :code  => 'uk',
        :emoji => '🇬🇧'
    },
    {
        :name  => 'Japan',
        :code  => 'jp',
        :emoji => '🇯🇵'
    },
    {
        :name  => 'Spain',
        :code  => 'es',
        :emoji => '🇪🇸'
    },
    {
        :name  => 'Hong Kong',
        :code  => 'hk',
        :emoji => '🇭🇰'
    }
]

# String class with custom flag_emoji method
class String
    def flag_emoji
        # Strip and lowercase code
        new_code = self.strip.downcase
        # Find country by code. If not found, default to empty string.
        country = $COUNTRIES.find do |record|
            record[:code] == new_code
        end || ''
        
        # Return emoji if country contains value, else return ? emoji
        return country.length > 0 ? country[:emoji] : '❓'
    end
end

# Function to replace all instances of a country code with a flag
def replace_country_code( value )
    $COUNTRIES.each do |record|
        # Replace country code with emoji using gsub
        # Use interpolation with regex then compare the variable with i option to ignore case sensitivity 
        value = value.gsub(/#{record[:code]}/i, record[:code].flag_emoji+" ") # I chose not to use gsub with ! because it was modifying the reference variable
    end
    return value
end

# Function to get country name
def get_country_name( code )
    # Strip and lowercase code
    new_code = code.strip.downcase
    # Find country by code. If not found, default to empty string.
    country = $COUNTRIES.find do |record|
        record[:code] == new_code.downcase
    end || ''

    return country.length > 0 ? "The country you selected is #{country[:name]}." :
                                'That country code is not in our database.'
end

# Ask user for input
print "Enter any word or country code: "
word = gets
# Display output
puts get_country_name(word).white.on_black.bold
puts "Therefore, the emoji for #{word.strip} is #{word.flag_emoji}".white.on_black.bold
puts "#{word.strip} = #{replace_country_code(word)}".strip.white.on_black.bold

# puts get_country_name(word).white.on_black.bold

# puts 'au'.flag_emoji
# puts 'AU'.flag_emoji
# puts 'fr'.flag_emoji
# puts 'us'.flag_emoji
# puts 'ph'.flag_emoji
# puts 'br'.flag_emoji
# puts 'xx'.flag_emoji

# puts replace_country_code('au')
# puts replace_country_code('fr')
# puts replace_country_code('us')
# puts replace_country_code('ph')
# puts replace_country_code('br')
# puts replace_country_code('xx')

# puts replace_country_code('australia')
# puts replace_country_code('france')
# puts replace_country_code('usa')
# puts replace_country_code('philippines')
# puts replace_country_code('brazil')
# puts replace_country_code('austrAliau')
# puts replace_country_code('PhiLippinEs')
# puts replace_country_code('aUsTraLiAUsA')
# puts replace_country_code('UsAuStrALiA')
