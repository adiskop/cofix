

  class Travelo::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
        binding.pry
    end


    def self.scrape_activities(destination)

    end



  end
