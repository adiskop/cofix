

  class Travelo::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://www.townandcountrymag.com/leisure/travel-guide/a25052734/best-places-to-travel-2019/"))
        binding.pry
    end


    def self.scrape_activities(destination)

    end



  end
