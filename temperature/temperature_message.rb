# temperature_message.rb
# Checks temperature and outputs a message

#String.colors => [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
#String.modes => [:default, :bold, :italic, :underline, :blink, :swap, :hide]

# Gem to color stuff
require 'colorize'

# Celsisus to Fahrenheit
# Formula: C * 9/5 + 32
def get_fahrenheit_from_celsius( celsius )
    return fahrenheit = celsius * (9.0 / 5.0) + 32.0
end

# Get temperature string from user input, convert to Float and validate
begin
    print "\t\tEnter Temperature in °C:".blue.on_white.bold + " "
    current_temp = Float(gets)
rescue
    puts "\t\tThat was an invalid value. Try again.".white.on_red.bold
    retry
end


# Convert Celsius to Fahrenheit
current_temp_fahrenheit = get_fahrenheit_from_celsius( current_temp )


# Check temperature
# > 30, .red
# > 20, .yellow
# > 10, .cyan
# .blue
if current_temp > 30
    puts "\t\tIt is blazing hot".red.bold
    puts "\t\t#{current_temp.round(3)} °C ----> #{current_temp_fahrenheit.round(3)} °F".red.bold
elsif current_temp > 20
    puts "\t\tIt is warm".yellow.bold
    puts "\t\t#{current_temp.round(3)} °C ----> #{current_temp_fahrenheit.round(3)} °F".yellow.bold
elsif current_temp > 10
    puts "\t\tWinter is coming".cyan.bold
    puts "\t\t#{current_temp.round(3)} °C ----> #{current_temp_fahrenheit.round(3)} °F".cyan.bold
else
    puts "\t\tWinter has come".blue.bold
    puts "\t\t#{current_temp.round(3)} °C ----> #{current_temp_fahrenheit.round(3)} °F".blue.bold
end
