class Service
    # include BCrypt
# - @name e.g. "Netflix"
# - @accounts
# - @email
# - @content

    attr_accessor :name     # String
    attr_accessor :accounts # Array of Account
    attr_accessor :email    # String
    attr_accessor :content  # Array of Content

    def initialize
        # Initialize list of Accounts
        @accounts = Array.new
        
        # Initialize list of Content
        @content = Array.new
    end

    # e.g. netflix.welcome_message
    def welcome_message
        # e.g. "Welcome to Netflix"
        "Welcome to #{self.name}"
    end

    # Can do:
    # - .sign_up_account
    # - .delete_account
    
    def sign_up_account(email, first_name, last_name, date_of_birth, password)
        # Create New Account
        new_account = Account.new
        new_account.email = email.downcase # E-mail will always be in lower case for consistency
        new_account.password = password #Password.create(password)

        # Create New Profile
        new_profile = Profile.new
        new_profile.first_name = first_name.capitalize #Capitalize first name
        new_profile.last_name = last_name.capitalize #Capitalize last name
        new_profile.date_of_birth = date_of_birth

        # Connect New Account with New Profile
        new_account.add_profile(new_profile)

        # Add New Account to list of all Service Accounts
        #@accounts << new_account
        self.add_account(new_account)
    end

    # Add new account
    def add_account(new_account)
        @accounts << new_account unless @accounts.include?(new_account)
    end

    # Delete account
    def delete_account(account)
        @accounts.delete(account) if @accounts.include?(account)
    end

    # Search for an Account using e-mail address
    # Returns the account if found
    def search_account(email)
        found_account = self.accounts.find do |account|
            account.email == email.downcase
        end
        found_account
    end

    # Get accounts in array of hashes format
    def get_all_accounts_data
        
        accounts_array = Array.new

        self.accounts.each do |account|
            
            account_hash = Hash.new
            account_hash[:email] = account.email
            account_hash[:profiles] = Array.new
            account_hash[:credit_cards] = Array.new
            account_hash[:password] = account.password
            
            account.profiles.each do |profile|
                profile_hash = Hash.new
                profile_hash[:first_name] = profile.first_name
                profile_hash[:last_name] = profile.last_name
                profile_hash[:date_of_birth] = profile.date_of_birth
                profile_hash[:favorite_genre] = profile.favorite_genre
                account_hash[:profiles] << profile_hash
            end

            account.credit_cards.each do |credit_card|
                credit_cards_hash = Hash.new
                credit_cards_hash[:number] = credit_card.number
                credit_cards_hash[:holder_name] = credit_card.holder_name
                credit_cards_hash[:issuing_bank] = credit_card.issuing_bank
                credit_cards_hash[:expiration_date] = credit_card.expiration_date
                credit_cards_hash[:security_code] = credit_card.security_code
                account_hash[:credit_cards] << credit_cards_hash
            end
            
            accounts_array << account_hash
        end
        
        accounts_array

    end


    def download_accounts_to_json_file
        File.write('data.json', self.get_all_accounts_data.to_json)
        # puts self.get_all_accounts_data.to_json
        # puts get_all_accounts_data.map { |o| Hash[o.each_pair.to_a] }.to_json

        # File.open("output.json","w") do |f|
        #     f.write(self.get_all_accounts_data.to_json)
        # end
    end

    # Load data from file
    def load_data_file
        puts "Reading JSON File...".white.bold
        file = File.read('data.json')
        data_hash = JSON.parse(file)
        data_hash.each do |key, value|

            if self.search_account(key['email']).nil?   # Check if email doesn't exists. If true, continue

                data_account = Account.new
                data_account.email = key['email']
                data_account.password = key['password']

                key['profiles'].each do |profile|
                    data_profile = Profile.new
                    data_profile.first_name = profile["first_name"]
                    data_profile.last_name = profile["last_name"]
                    data_profile.date_of_birth = profile["date_of_birth"]
                    data_profile.favorite_genre = profile["favorite_genre"]
                    data_account.add_profile(data_profile)
                end
                
                key['credit_cards'].each do |credit_card|
                    data_credit_card = Credit_Card.new
                    data_credit_card.number = credit_card['number']
                    data_credit_card.holder_name = credit_card['holder_name']
                    data_credit_card.issuing_bank = credit_card['issuing_bank']
                    data_credit_card.expiration_date = credit_card['expiration_date']
                    data_credit_card.security_code = credit_card['security_code']
                    data_account.add_credit_card(data_credit_card)
                end
                
                self.add_account(data_account)
            end

        end
    end

    # Sign In
    # Returns the true if sign-in is successful
    def sign_in(email, password)
        login_account = search_account(email)
        if login_account.nil?
            false
        else
            puts login_account.password
            puts password
            login_account.password == password
            # puts Password.new(login_account.password)
            # puts Password.create(login_account.password)
        end
    end

    # Display everything about the Service
    def display_everything
        puts "-----------------------------------------------------------------------".white.bold
        puts "Number of netflix accounts: #{self.accounts.length}"
        puts "All accounts:"
        self.accounts.each do |account|
            puts "Account E-mail: #{account.email}"
            puts "Account Password: #{account.password}"
            if account.profiles.length > 0
                puts "Account Profiles:"
                account.profiles.each do |profile|
                    puts "Profile Name: #{profile.first_name} #{profile.last_name}"
                    puts "Profile Birthday: #{profile.date_of_birth}"
                    puts "Favorite Genre: #{profile.favorite_genre}"
                    puts "Profile belongs to Account: #{profile.account.email}"
                    puts ''
                end
            end
            if account.credit_cards.length > 0
                puts "Account Credit Cards:"
                account.credit_cards.each do |card|
                    puts "Credit Card Number: #{card.number}"
                    puts "Credit Card Holder: #{card.holder_name}"
                    puts "Credit Card Bank: #{card.issuing_bank}"
                    puts "Credit Card Expiration Date: #{card.expiration_date}"
                    puts "Credit Card Security Code: #{card.security_code}"
                    puts ''
                end
            end
        end
        puts "-----------------------------------------------------------------------".white.bold
    end
end