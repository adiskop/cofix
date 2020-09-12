class Travelo::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://bigseventravel.com/category/coffee/"))

        array_of_destinations = index_page.css("div.col-12.col-md-6")

        array_of_destinations.each do |destination_card|
          attributes =  {
        title: destination_card.css("h3.entry-title.h4.sm-h2.m-h1 a").text ,
        url:  destination_card.css("h3.entry-title.h4.sm-h2.m-h1 a")[0].attributes['href'].value,
        read_time: destination_card.css("div.entry-meta.entry-meta-small").text ,
      }
      destination = Travelo::Destination.new(attributes)

    end
  end

    def self.scrape_activities(destination)

    end



end
