class Credit_Card
# - number: String (16-digits all numbers)
# - holder_name: String
# - issuing_bank: String
# - expiration_date: Date
# - security_code: String (3-digits all numbers)

    attr_accessor :number # - number: String (16-digits all numbers)
    attr_accessor :holder_name # - holder_name: String
    attr_accessor :issuing_bank # - issuing_bank: String
    attr_accessor :expiration_date # - expiration_date: Date
    attr_accessor :security_code # - security_code: String (3-digits all numbers)

    # Can do:
    # - .new

    # Credit Card can't do anything else for now
end