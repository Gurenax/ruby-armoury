# emoji_string_class.rb

# 1. Add a .flag_emoji method to String
# 2. Add a method to replace all occurences of au with its flag emoji

class String
    def emoji
        case self.downcase.strip
            when 'wolf'
                '🐺'
            when 'gorilla'
                '🦍'
            when 'rhino', 'rhinoceros'
                '🦏'
            when 'owl'
                '🦉'
            when 'lion'
                '🦁'
            when 'tiger'
                '🐯'
            when 'octopus'
                '🐙'
            when 'chicken'
                '🐓'
            when 'dog'
                '🐶'
            when 'human'
                '👮‍'
            when 'eagle'
                '🦅'
            when 'fish'
                '🐟'
            when 'unicorn'
                '🦄'
            else
                '❓'
        end
    end
end

puts 'wolf'.emoji
puts 'gorilla'.emoji
puts 'owl'.emoji
puts 'notsure'.emoji
