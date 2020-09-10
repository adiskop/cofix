scraper.rb

  class Travelo::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://travel.usnews.com/rankings/worlds-best-vacations/"))
        binding.pry
    end


    def self.scrape_activities(destination)

    end

  end
