require 'date'

class Profile
# - @primary_account
# - @first_name
# - @last_name
# - @date_of_birth
# - def country
# TODO:
# - @nickname?

    attr_accessor :account # Account
    attr_accessor :first_name # String
    attr_accessor :last_name # String
    attr_accessor :date_of_birth # Date
    attr_accessor :favorite_genre # String

    # Hard-coded Australia for now
    def country
        'Australia'
    end

end