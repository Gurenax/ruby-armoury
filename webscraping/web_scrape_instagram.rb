require 'httparty'
require 'pry'

# this is how we request the page we're going to scrape

def scrape_photo(username)

    base_url = "https://www.instagram.com/#{username}/media"
    url = base_url

    instagram = Array.new

    while true

        # Use HTTParty to retrieve the JSON response
        page = HTTParty.get(url).parsed_response

        # Reset last_id
        last_id = ""

        page["items"].each do |page_item|
            # items.each do |k,v|
            #     p k
            # end
            # items["images"].each do |images|
            #     p images
            # end

            last_id = page_item["id"]
            caption = page_item["caption"]["text"] unless page_item["caption"].nil?
            thumbnail = page_item["images"]["thumbnail"]["url"] unless page_item["images"].nil?
            low_resolution = page_item["images"]["low_resolution"]["url"] unless page_item["images"].nil?
            standard_resolution = page_item["images"]["standard_resolution"]["url"] unless page_item["images"].nil?

            instagram_item = {
                :last_id => last_id,
                :caption => caption,
                :thumbnail => thumbnail,
                :low_resolution => low_resolution,
                :standard_resolution => standard_resolution,
            }
            instagram << instagram_item
        end
        if page["more_available"]==true
            next_page_token = "/?max_id=#{last_id}"     # /?max_id=1537732482693479519_54429723
            url = base_url + next_page_token
        else
            break
        end
    end

    instagram
end


test_hash = scrape_photo("goproglenn")


pry.start(binding)