# temperature_week.rb
# Displays the temperatures for the week in both Celsius and Fahrenheit.

# Gem for a Tabled UI
require 'terminal-table'
# Gem to Color terminal texts
require 'colorize'

# Celsisus to Fahrenheit
# Formula: C * 9/5 + 32
def get_fahrenheit_from_celsius( celsius )
    return fahrenheit = celsius * (9.0 / 5.0) + 32.0
end

# Color the Strings for every °C
# - 30 or above: colour red
# - Below 30: colour yellow
# - Below 20: colour cyan
# - Below 10: colour blue
def get_color ( value, temperature )
    if temperature < 10
        return value.light_blue

    elsif temperature < 20
        return value.light_cyan

    elsif temperature < 30
        return value.light_yellow

    else
        return value.light_red

    end
end

# Describe the Weather
def describe_weather ( temperature )
    if temperature < 10
        return "Winter has come"

    elsif temperature < 20
        return "Winter is coming"

    elsif temperature < 30
        return "It is a bit warm"

    else
        return "It is very hot"

    end
end

# Generate the Table
def generate_table ( tableHeadings, tableRows, tableStyle )
    table = Terminal::Table.new
    
    # Customise the Table
    table.headings = tableHeadings
    table.rows = tableRows
    table.style = tableStyle
    table.align_column(3, :left)
    table.align_column(4, :left)

    return table
end

# Days of the Week
weeks = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
# Array for temperatures
temperature = []
# Array of Items
rows = []

# Loop each week and ask the user for input
weeks.each_with_index do |day_of_the_week, index|

    # Get temperature string from user input, convert to Float and validate
    begin
        print "Enter ".magenta.on_black.bold +
              "#{day_of_the_week}".yellow.on_black.bold +
              "'s Temperature in °C:".magenta.on_black.bold + "\t"
        temperature << Float(gets)
    rescue
        puts "That was an invalid value. Try again.".white.on_red.bold
        retry
    end

    # User Visible Index
    day_index = (index + 1).to_s
    # Get Celcius
    celsius = temperature[index]
    # Convert Celsius to String
    celsiusString = celsius.round(3).to_s + " °C"
    # Calculate Fahrenheit and Convert to String
    fahrenheit = get_fahrenheit_from_celsius(celsius).round(3).to_s + " °F"

    # Color all the Values
    colored_index = get_color(day_index, celsius)
    colored_day = get_color(day_of_the_week, celsius)
    colored_description = get_color( describe_weather(celsius) , celsius).italic
    colored_celsius = get_color(celsiusString, celsius)
    colored_fahrenheit = get_color(fahrenheit, celsius)
    
    # Add items to rows array
    rows << [colored_index, colored_day, colored_description, colored_celsius, colored_fahrenheit]
end

# Table Headings
tableHeadings = ['#'.magenta.bold, 'DAY'.magenta.bold, 'WEATHER'.magenta.bold,
                 'CELSIUS'.magenta.bold, 'FAHRENHEIT'.magenta.bold]

# Table Style and Color
tableStyle = { :border_x => "=".magenta.on_magenta.bold,
               :border_i => "x".magenta.on_magenta.bold,
               :border_y => '|'.magenta.on_magenta.bold,
               :alignment => :center }

# Output and Generate the table
puts generate_table( tableHeadings, rows, tableStyle )