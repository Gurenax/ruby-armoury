# Find the pattern for
# 1, 5, 9   -Ash Blue
# 2, 6, 10  -True Blue
# 3, 7, 11  -Deep Blue
# 4, 8, 12  -Brown

$i = 1
$count = 12
while $i <= $count
    if $i % 4 == 1
        puts "#{$i} is for every 1st and is therefore Ash Blue" 
    elsif $i % 4 == 2
        puts "#{$i} is for every 2nd and is therefore True Blue" 
    elsif $i % 4 == 3
        puts "#{$i} is for every 3rd and is therefore Deep Blue" 
    elsif $i % 4 == 0
        puts "#{$i} is for every 4th and is therefore Brown"
    end
    $i += 1
end

