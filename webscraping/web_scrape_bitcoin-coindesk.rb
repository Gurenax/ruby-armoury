require 'httparty'
# require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

# this is how we request the page we're going to scrape
page = HTTParty.get('https://api.coindesk.com/v1/bpi/currentprice.json').parsed_response

# parse page with JSON.parse
bitcoin_hash = JSON.parse(page)

# # this is where we transform our http response into a nokogiri object
# parse_page = Nokogiri::HTML(page)

# # this is an empty array where we will store all the bitcoin data
# data_array = []

# # this is where we parse the data
# parse_page.css('.currency').map do |a|
#     bit_coin_price = a.text
#     data_array.push(bit_coin_price)
# end

# p data_array

# this will push your array into a CSV file
# CSV.open('bitcoins.csv', 'w') do |csv|
#     csv << data_array
# end

pry.start(binding)