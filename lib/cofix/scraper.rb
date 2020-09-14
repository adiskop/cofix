class Cofix::Scraper

    def self.scrape_destinations
        index_page = Nokogiri::HTML(open("https://bigseventravel.com/category/coffee/"))

        array_of_destinations = index_page.css("div.col-12.col-md-6")

        array_of_destinations.each do |destination_card|
          attributes =  {
        title: destination_card.css("h3.entry-title.h4.sm-h2.m-h1 a").text,
        url:  destination_card.css("h3.entry-title.h4.sm-h2.m-h1 a")[0].attributes['href'].value,
        read_time: destination_card.css("div.entry-meta.entry-meta-small").text ,
      }
      destination = Cofix::Destination.new(attributes)

    end
  end

    def self.scrape_tops(destination_object)

    top_page = Nokogiri::HTML(open(destination_object.url))
    tops = top_page.css("h3")  #array of list of 7 best coffees


      #instantiate a new top
      top_object = Cofix::Top.new
      #top_object= top object
      #associate that top with this destination
      #top_object.destination = destination_object
      #set any top attributes
      top_object.best = top_page.css("h3")[0].children.text
      top_object.link = top_page.css("h3 a")[0].attributes['href'].value

      #add this top to destination.tops
      #destination_object.tops << top_object
      destination_object.add_top(top_object)

#    end

    end

end
