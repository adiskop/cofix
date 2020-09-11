class Travelo::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://www.goodhousekeeping.com/life/travel/g30335840/best-places-to-travel-2020/"))

        array_of_destinations = index_page.css("div.listicle-slide.listicle-slide-square.listicle-slide-image")

        array_of_destinations.each do |destination_card|
          binding.pry
    end
  end

    def self.scrape_activities(destination)

    end



end
