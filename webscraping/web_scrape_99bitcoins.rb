require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

# this is how we request the page we're going to scrape
page = HTTParty.get('https://99bitcoins.com/price-chart-history/')

# this is where we transform our http response into a nokogiri object
parse_page = Nokogiri::HTML(page)

# this is an empty array where we will store all the data
data_array = []

# this is where we parse the data
parse_page.css('.bitcoin_history').map do |a|
    bitcoin_data = {
        :post_name => a.css('h3').text,
        :bit_coin_value_current => a.css('.info').css('.label-info').text,
        :bit_coin_value_10_days_later => a.css('.info').css('span:nth-of-type(4)').text
    }
    data_array.push(bitcoin_data)
end

# this will push your array into a CSV file
# CSV.open('pets.csv', 'w') do |csv|
#     csv << data_array
# end

pry.start(binding)