# require 'bcrypt' # To encrypt passwords
require_relative 'service'
require_relative 'account'
require_relative 'profile'
require_relative 'credit_card'
require_relative 'content'
require_relative 'menu'

require 'colorize'
require 'io/console' # Use STDIN.noecho(&:gets).chomp to hide password input
require 'json' # To read a JSON file

require 'pry'

#puts 'Success!'

netflix = Service.new
netflix.name = 'Netflix'

# puts netflix.welcome_message

# netflix.sign_up_account('madmax@example.com', 'Max', 'Mad', Date.new(2018, 7, 4), 'P@ssw0rd1234')

# latest_account = netflix.accounts.last
# puts "Latest account: #{latest_account.email}"

# # Challenges:
# # 1. Create a new account from user input
# # e.g.
# # Enter your email:
# # >
# # Enter your first name:
# # >
# # Enter your last name:
# # >
# # Enter your date of birth:
# # >

# # 2. Add a profile to an existing account
# # 3. Add credit card to Account
# # Hint: credit card will probably have its own class
# # 4. List all the profiles for an account in a menu (e.g. lots of `puts`)
# # 5. Add a password to Account
# # 6. When running your app, show a menu with:
# #     1. Create Account
# #     2. Sign In
# # 7. Add favorite genre to Profile
# # 8. Add a class for content, and create a library

# puts ''
# puts ''


# # Ask for new account details
# puts "Enter your email: ".white.bold
# new_email = "glenn.dimaliwat@gmail.com" #gets.chomp
# puts "Enter your first name: ".white.bold
# new_first_name = "Glenn" #gets.chomp
# puts "Enter your last name: ".white.bold
# new_last_name = "Dimaliwat" #gets.chomp
# puts "Enter your date of birth (DD/MM/YYYY): ".white.bold
# new_dob_string = "15/06/1986" #gets.chomp
# new_dob = Date.parse(new_dob_string)
# puts "Enter your password: ".white.bold
# new_password = "P@ssw0rd1234" #gets.chomp

# # Sign up new account through Service
# netflix.sign_up_account(new_email, new_first_name, new_last_name, new_dob, new_password)
# netflix.display_everything


# ### Adding a 2nd account ###
# puts "Adding a 2nd account... John Smith".white.bold
# new_profile = Profile.new
# new_profile.first_name = "John" #gets.chomp
# new_profile.last_name = "Smith" #gets.chomp
# new_dob_string = "01/01/1990" #gets.chomp
# new_dob_string.split('/')
# new_profile.date_of_birth = Date.parse(new_dob_string)
# searched_account = netflix.search_account("glenn.dimaliwat@gmail.com")
# searched_account.add_profile(new_profile)
# netflix.display_everything


# ### Adding a Credit Card to my account glenn.dimaliwat@gmail.com ###
# puts "Adding a Credit Card...".white.bold
# glenns_credit_card = Credit_Card.new
# glenns_credit_card.number = '1111111111111111'
# glenns_credit_card.holder_name = 'Glenn Dimaliwat'
# glenns_credit_card.issuing_bank = 'Commonwealth Bank'
# expiration_date = '31/12/2020'
# glenns_credit_card.expiration_date = Date.parse(expiration_date)
# glenns_credit_card.security_code = '111'
# searched_account = netflix.search_account("glenn.dimaliwat@gmail.com")
# searched_account.add_credit_card(glenns_credit_card)
# netflix.display_everything


# ### Adding Favorite Genre to my account glenn.dimaliwat@gmail.com
# puts "Adding Favorite Genre...".white.bold
# #with profile name Glenn Dimaliwat
# searched_profile = searched_account.search_profile_by_name("Glenn", "Dimaliwat")
# searched_profile.favorite_genre = 'TV Shows'
# #with profile name John Smith
# searched_profile = searched_account.search_profile_by_name("John", "Smith")
# searched_profile.favorite_genre = 'US TV Shows'
# #with account madmax@example.com and profile Max Mad
# searched_account = netflix.search_account("madmax@example.com")
# searched_profile = searched_account.search_profile_by_name("Max", "Mad")
# searched_profile.favorite_genre = 'TV Action & Adventure'
# netflix.display_everything


### Adding Content to Netflix service
puts "Adding Content to Netflix service...".white.bold
daredevil = Content.new
daredevil.title = 'Daredevil'
daredevil.description = 'Blinded as a young boy, Matt Murdock fights injustice by day as a lawyer and by night as the Super Hero Daredevil in Hell\'s Kitchen, New York City.'
daredevil.starring = ['Charlie Cox', 'Deborah Ann Woll', 'Elden Henson']
daredevil.genre = ['TV Shows', 'US TV Shows', 'TV Action & Adventure']
daredevil.year_released = 2016
daredevil.material_rating = 'MA 15+'
daredevil.duration = '2 Seasons'
daredevil.region = ['Australia', 'United States']
daredevil.url = 'https://www.netflix.com/title/80018294'
netflix.content << daredevil

jessica = Content.new
jessica.title = 'Jessica Jones'
jessica.description = 'Haunted by a traumatic past, Jessica Jones uses her gifts as a private eye to find her tormentor before he can harm anyone else in Hell\'s Kitchen.'
jessica.starring = ['Krysten Ritter', 'David Tennant', 'Rachael Taylor']
jessica.year_released = 2015
jessica.material_rating = 'MA 15+'
jessica.duration = '1 Season'
jessica.genre = ['TV Shows', 'US TV Shows', 'TV Dramas', 'TV Action & Adventure']
jessica.region = ['Australia', 'United States']
jessica.url = 'https://www.netflix.com/title/80002311'
netflix.content << jessica

ca_civil_war = Content.new
ca_civil_war.title = 'Captain America: Civil War'
ca_civil_war.description = 'It\'s Avengers vs. Avengers when Captain America fights to keep his superhero friends independent, while his pal Iron Man supports government control.'
ca_civil_war.starring = ['Chris Evans', 'Robert Downey Jr.', 'Scarlett Johansson']
ca_civil_war.year_released = 2016
ca_civil_war.material_rating = 'M'
ca_civil_war.duration = '2h 28m'
ca_civil_war.genre = ['Action & Adventure', 'Adventures', 'Sci-Fi & Fantasy', 'Sci-Fi Adventure', 'Action Sci-Fi & Fantasy']
ca_civil_war.region = ['Australia', 'United States']
ca_civil_war.url = 'https://www.netflix.com/title/80002311'
netflix.content << ca_civil_war

netflix.content.each do |show|
    puts show.title
end

#### Read JSON File
netflix.load_data_file

### Proceed to Main Menu
puts "Press <Enter> to continue".white.bold
continue = gets

# Show Main Menu
main_menu(netflix)