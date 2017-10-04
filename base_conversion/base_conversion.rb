# Methods to take a string then convert to target number base
# String in Base 3 to Decimal (Base 10)
# String in Base 7 to Decimal (Base 10)
# String in Base 2 (Binary) to Decimal (Base 10)
# Hard
# Any string and a number representing any base (up to 10)
# and convert to decimal (up to HEX)

# Base X to Decimal
def convert_to_decimal(input, base)
    # Convert the string to an array of numbers
    if base <= 10
        numbers = input.split("").map(&:to_i)
    else
        numbers = convert_strings_with_hex(input, base)
    end

    # Get the largest exponent
    largest_exponent = numbers.size - 1
    
    # Initialise the result
    result = 0
    
    # Compute from left digit to right digit
    numbers.map { |num|
        result += num * (base**largest_exponent)    # Multiply each digit to the base * exponent
        largest_exponent -= 1                       # Decrement the exponent by 1 to get the next digit
    }
    result
end

# Convert Strings with Hex Letters
def convert_strings_with_hex(input, base)
    # Convert the string to an array of numbers
    numbers = input.split("")
    numbers.map! { |n|
        case n
            when "A"
                n = 10
            when "B"
                n = 11
            when "C"
                n = 12
            when "D"
                n = 13
            when "E"
                n = 14
            when "F"
                n = 15
            else
                n = n.to_i
        end
    }
    numbers
end

# Convert Hex Letters to String
def convert_hex_to_string(input)
    # numbers = input.split("")
    numbers = input
    numbers.map! { |n|
        case n
            when "10"
                n = "A"
            when "11"
                n = "B"
            when "12"
                n = "C"
            when "13"
                n = "D"
            when "14"
                n = "E"
            when "15"
                n = "F"
            else
                n = n
        end
    }
    numbers
end

# Convert decimal to hex
def convert_decimal_to_hex(input, base)

    # Convert input number to integer
    number = input.to_i

    # Create array for hex digits
    hex = Array.new

    # Convert to Base 11 up to 16
    while number > 0
        hex << (number % base).to_s
        number = number / base
    end

    # hex
    convert_hex_to_string(hex).reverse.join
end


# p convert_to_decimal("221",3)
# p convert_to_decimal("4132",6)
# p convert_to_decimal("4132",6)
# p convert_to_decimal("4324",7)
# p convert_to_decimal("1001",2)
# p convert_to_decimal("8CE", 16)

# p convert_to_decimal("100", 10)

# p "----"
# p convert_decimal_to_hex("495",16)
# p convert_decimal_to_hex("2254",16)

# p convert_decimal_to_hex(1983425, 11)
p convert_decimal_to_hex(2254, 16)

# p convert_decimal_to_hex(15, 16)
# p convert_decimal_to_hex(16, 16)


DIGITS = ('0'..'9').to_a + ('A'..'Z').to_a
def number_to_base(number, base)
    return '0' if number == 0
    return 'indeterminate' if base < 2

    output = ''
    while number > 0
        bit = number % base
        letter = DIGITS[bit]
        output = letter + output
        number = number / base
    end
    output
end