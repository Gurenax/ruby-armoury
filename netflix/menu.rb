# Show a Press enter to continue message
def show_message_continue
    puts "\nPress <Enter> to continue".white.bold
    gets # Let user press Enter
end

# Show an Invalid option message
def show_message_invalid_option
    puts "\nThat was an invalid option!".white.bold
    show_message_continue
end

# Show a line separator
def show_line_separator
    puts "-----------------------------------------------------------------------".white.on_red.bold
end

# Clear Screen Command
def clear_screen
    system("clear")
end

# Show Create Account Menu
def create_account(service)

    # Input user details
    print "Enter your email: ".white.bold
    new_email = gets.chomp

    # Search account if it already exists
    if service.search_account(new_email).nil?
        print "Enter your first name: ".white.bold
        new_first_name = gets.chomp
        print "Enter your last name: ".white.bold
        new_last_name = gets.chomp
        print "Enter your date of birth (DD/MM/YYYY): ".white.bold
        new_dob_string = gets.chomp
        new_dob = Date.parse(new_dob_string)
        print "Enter your password: ".white.bold
        new_password = STDIN.noecho(&:gets).chomp

        # Call service to sign up an account
        service.sign_up_account(new_email, new_first_name, new_last_name, new_dob, new_password)

        # Display sign up success
        puts "\nSign up successful!".white.bold

    else
        # Display sign up success
        puts "\nSign up failed! The account (#{new_email}) already exists.".white.bold
    end
end

# Show Sign In Menu
def sign_in_menu(service)
    user_signed_in = '' # Initialize user_signed_in variable

    print "Enter your email: ".white.bold
    sign_in_email = gets.chomp
    print "Enter your password: ".white.bold
    sign_in_password = STDIN.noecho(&:gets).chomp
    
    # Sign in to account
    sign_in_successful = service.sign_in(sign_in_email, sign_in_password)

    # Check if Sign in is successful
    if sign_in_successful == true
        # Sign in successful. Now select a profile
        user_signed_in = true
        puts "\n\nSign in successful!".white.bold
        show_message_continue
    else
        # Sign in credentials were incorrect
        user_signed_in = false
        sign_in_email = ''
        puts "\n\nSign in failed!".white.bold
        show_message_continue
    end
    sign_in_email # Return the email which the user used to sign in
end

# Show Profiles Menu
def show_profiles_menu(all_profiles)
    clear_screen
    show_line_separator
    puts "|".white.on_red.bold
    print "|".white.on_red.bold
    puts " Select a profile:".white.bold
    profile_index = 1
    all_profiles.each do |profile|
        print "|".white.on_red.bold
        puts " [#{profile_index}] #{profile.first_name} #{profile.last_name}".white.bold
        profile_index += 1
    end
    print "|".white.on_red.bold
    puts " [X] Back".white.bold
    puts "|".white.on_red.bold
    show_line_separator
    print "Enter choice: ".white.bold
end

# Show Library Menu
def show_library_menu(content)
    clear_screen
    show_line_separator
    content.each do |video|
        puts "|".white.on_red.bold
        print "|".white.on_red.bold
        puts " #{video.title}".white.bold
        print "|".white.on_red.bold
        puts " #{video.year_released} | #{video.material_rating} | #{video.duration}".white.bold
        print "|".white.on_red.bold
        puts " #{video.description}".white.bold
        print "|".white.on_red.bold
        puts " Starring: #{video.starring.join(", ")}".white.bold
        print "|".white.on_red.bold
        puts " Genre: #{video.genre.join(", ")}".white.bold
        print "|".white.on_red.bold
        puts " Availability: #{video.region.join(", ")}".white.bold
        print "|".white.on_red.bold
        puts " More info: #{video.url}".white.bold
        puts "|".white.on_red.bold
        show_line_separator
    end
end

# Show Profiles Menu
def select_profile_menu(account)
    
    # Get list of profiles
    all_profiles = account.profiles # Get Profile

    # Show Profile Selector UI
    begin
        show_profiles_menu(all_profiles)
        choice_profile = gets.chomp.upcase
        if choice_profile == ''
            raise 'Invalid profile selected'

        elsif choice_profile.to_i < 0 || choice_profile.to_i > all_profiles.length
            raise 'Invalid profile selected'

        elsif choice_profile != 'X' # If user did not press Back
            if choice_profile.to_i > 0 # If user selected a valid menu number
                # Select a profile
                choice_profile_no = choice_profile.to_i - 1
                user_profile = "#{all_profiles[choice_profile_no].first_name} #{all_profiles[choice_profile_no].last_name}"
                
                # Show selected profile
                puts "\nSelected Profile: #{user_profile}".white.bold
                show_message_continue
            else
                raise 'Invalid profile selected'
            end

        else
            # Sign in was cancelled. No profile was selected.
            user_signed_in = false
            sign_in_email = ''

        end
        user_profile # Return selected user_profile

    rescue Exception => e
        if e.message == 'Invalid profile selected'
            puts "\nInvalid profile selected".white.bold
        else
            puts "\nUnexpected error occured".white.bold
            binding.pry
        end
        show_message_continue
        retry
    end
end

# Show Add Profile Menu
def add_profile_menu(service, sign_in_email)
    # Search for the account signed in
    sign_in_account = service.search_account(sign_in_email) # Get Account

    # Input new profile details
    print "Enter your first name: ".white.bold
    new_first_name = gets.chomp
    print "Enter your last name: ".white.bold
    new_last_name = gets.chomp
    print "Enter your date of birth (DD/MM/YYYY): ".white.bold
    new_dob_string = gets.chomp
    new_dob = Date.parse(new_dob_string)
    print "What is your favorite genre? : ".white.bold 
    new_favorite_genre = gets.chomp

    # Create new profile
    new_profile = Profile.new
    new_profile.first_name = new_first_name.capitalize
    new_profile.last_name = new_last_name.capitalize
    new_profile.date_of_birth = new_dob
    new_profile.favorite_genre = new_favorite_genre

    # Add new profile to account
    sign_in_account.add_profile(new_profile)

    # Display add profile success
    puts "\nNew profile added successfully!".white.bold
end

# Show Switch Profile Menu
def switch_profile_menu(service, sign_in_email)
    # Search for the account signed in
    sign_in_account = service.search_account(sign_in_email) # Get Account
    all_profiles = sign_in_account.profiles # Get Profile

    # Show Profile Selector UI
    begin
        show_profiles_menu(all_profiles)
        choice_profile = gets.chomp.upcase
        if choice_profile == ''
            raise 'Invalid profile selected'

        elsif choice_profile.to_i < 0 || choice_profile.to_i > all_profiles.length
            raise 'Invalid profile selected'

        elsif choice_profile != 'X' # If user did not press Back
            if choice_profile.to_i > 0 # If user selected a valid menu number
                # Select a profile
                choice_profile_no = choice_profile.to_i - 1
                user_profile = "#{all_profiles[choice_profile_no].first_name} #{all_profiles[choice_profile_no].last_name}"
                
                # Show selected profile
                puts "\nSelected Profile: #{user_profile}".white.bold
                show_message_continue
            else
                raise 'Invalid profile selected'
            end
            user_profile # Return selected user profile
        else
            # Profile change was cancelled. Do nothing
        end
    rescue Exception => e
        if e.message == 'Invalid profile selected'
            puts "\nInvalid profile selected".white.bold
        else
            puts "\nUnexpected error occured".white.bold
        end
        show_message_continue
        retry
    end
end

# Show Remove Profile Menu
def remove_profile_menu(service, sign_in_email, current_profile)
    # Search for the account signed in
    sign_in_account = service.search_account(sign_in_email) # Get Account
    all_profiles = sign_in_account.profiles # Get Profile

    # Show Profile Selector UI
    begin
        show_profiles_menu(all_profiles)
        choice_profile = gets.chomp.upcase
        if choice_profile == ''
            raise 'Invalid profile selected'

        elsif choice_profile.to_i < 0 || choice_profile.to_i > all_profiles.length
            raise 'Invalid profile selected'

        elsif choice_profile != 'X' # If user did not press Back
            if choice_profile.to_i > 0 # If user selected a valid menu number
                # Select a profile
                choice_profile_no = choice_profile.to_i - 1
                user_profile = "#{all_profiles[choice_profile_no].first_name} #{all_profiles[choice_profile_no].last_name}"
                
                # Remove the profile
                if user_profile == current_profile
                    # Show removed profile unsuccessful
                    puts "\nProfile #{user_profile} was not removed! You cannot removed a profile which is currently selected.".white.bold
                    
                elsif all_profiles.length > 1
                    sign_in_account.remove_profile(all_profiles[choice_profile_no])

                    # Show removed profile successful
                    puts "\nProfile #{user_profile} successfully removed!".white.bold
                else
                    # Show removed profile unsuccessful
                    puts "\nProfile #{user_profile} was not removed! You need atleast 1 profile in your account.".white.bold
                end
                show_message_continue
            else
                raise 'Invalid profile selected'
            end

        else
            # Profile change was cancelled. Do nothing
        end
    rescue Exception => e
        if e.message == 'Invalid profile selected'
            puts "\nInvalid profile selected".white.bold
        else
            puts "\nUnexpected error occured".white.bold
        end
        show_message_continue
        retry
    end
end

# Show Main Menu
def main_menu(service)
    ### Menu Variables
    user_signed_in = false
    sign_in_email = ''
    user_profile = ''
    
    ### Loop forever until user exits
    while true do
        clear_screen
        show_line_separator
        puts "|".white.on_red.bold
        print "|".white.on_red.bold
        puts user_profile.empty? ? " #{service.welcome_message}".white.bold : " #{service.welcome_message}, #{user_profile}".white.bold
        print "|".white.on_red.bold
        puts " [1] Create Account".white.bold
        print "|".white.on_red.bold
        puts user_signed_in ? " [2] Sign Out (#{sign_in_email})".white.bold : " [2] Sign In".white.bold
        print "|".white.on_red.bold if user_signed_in
        puts " [3] Add New Profile".white.bold if user_signed_in
        print "|".white.on_red.bold if user_signed_in
        puts " [4] Switch Profiles".white.bold if user_signed_in
        print "|".white.on_red.bold if user_signed_in
        puts " [5] Remove a Profile".white.bold if user_signed_in
        print "|".white.on_red.bold if user_signed_in
        puts " [6] View Library".white.bold if user_signed_in
        print "|".white.on_red.bold
        puts " [X] Exit".white.bold
        puts "|".white.on_red.bold
        show_line_separator
        print "Enter choice: ".white.bold
        
        # Input user's choice
        choice = gets.chomp.upcase

        # Check user's choice
        case choice
            when '1'    # Create Account
                if user_signed_in == false
                    create_account(service)
                else
                    puts "\nYou are already signed in as #{sign_in_email}. Please sign out before creating an account.".white.bold
                end
                show_message_continue

            when '2'    # Sign In / Out
                if user_signed_in == false
                    sign_in_email = sign_in_menu(service)
                    user_signed_in = !sign_in_email.empty? # If email is not blank, sign in successful
                    
                    if user_signed_in == true
                        sign_in_account = service.search_account(sign_in_email) # Get Account 
                        user_profile = select_profile_menu(sign_in_account)
                    end
                else
                    # User signed out
                    user_signed_in = false
                    puts "\n\nSign out successful!".white.bold
                    show_message_continue
                end

            when '3'    # Add Profiles
                if user_signed_in == true
                    add_profile_menu(service, sign_in_email)
                end
                show_message_continue

            when '4'    # Switch Profiles
                if user_signed_in == true
                    user_profile = switch_profile_menu(service, sign_in_email)
                else
                    show_message_invalid_option
                end

            when '5'    # Remove Profile
                if user_signed_in == true
                    remove_profile_menu(service, sign_in_email, user_profile)
                else
                    show_message_invalid_option
                end

            when '6'    # View Library
                if user_signed_in == true
                    show_library_menu(service.content)
                    show_message_continue
                else
                    show_message_invalid_option
                end

            when 'BACKDOOR'
                service.display_everything
                show_message_continue

            when 'X'    # Exit
                service.download_accounts_to_json_file
                puts "\nGoodbye!\n".white.bold
                exit
            else
                show_message_invalid_option
        end
    end
end