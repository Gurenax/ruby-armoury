require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

# this is an empty array where we will store all the hackernews
hackernews = []

# Page 1 to 3
(1..3).each { |page|
    # this is how we request the page we're going to scrape
    page = HTTParty.get("https://news.ycombinator.com/news?p=#{page}")

    # this is where we transform our http response into a nokogiri object
    parse_page = Nokogiri::HTML(page)

    # this is where we parse the data
    parse_page.css('.title').css('.storylink').map do |a|
        post_name = a.text
        hackernews.push(post_name)
    end
}

# this will push your array into a CSV file
CSV.open('hackernews.csv', 'w') do |csv|
    csv << hackernews
end

pry.start(binding)