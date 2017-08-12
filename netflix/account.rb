class Account
# - @email
# - @profiles
# TODO:
# - @credit_card

    attr_accessor :email # String
    attr_accessor :profiles # Array of Profile
    attr_accessor :credit_cards # Array of Credit Card
    attr_accessor :password # String (Encrypted)

    def initialize
        # Initialize list of profiles
        @profiles = Array.new

        # Initialize list of credit cards
        @credit_cards = Array.new
    end

    # Add a new profile
    def add_profile(profile)
        profile.account = self
        @profiles << profile unless @profiles.include?(profile)
    end

    # Remove a profile
    def remove_profile(profile)
        @profiles.delete(profile) if @profiles.include?(profile)
    end

    # Add a new credit card
    def add_credit_card(credit_card)
        @credit_cards << credit_card unless @credit_cards.include?(credit_card)
    end

    # Search for a profile
    # Returns true if profile is found
    def search_profile_by_name(first_name, last_name)
        found_profile = self.profiles.find do |profile|
            profile.first_name.downcase == first_name.downcase && profile.last_name.downcase == last_name.downcase
        end
        found_profile
    end

    # Can do:
    # - .new
    # - .add_profile
    # - .remove_profile
    # - .add_credit_card
    # - .remove_credit_card
end
