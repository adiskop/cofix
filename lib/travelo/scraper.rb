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

    def self.scrape_reviews(destination_object)

    review_page = Nokogiri::HTML(open(destination_object.url))
    reviews = review_page.css("h3")  #array of list of 7 best coffees

    reviews.each do |review_html|
      #instantiate a new review
      #ro= review object
    ro = Travelo::Review.new
      #associate that review with this destination
  #  ro.destination = destination_object
      #set any review attributes

 quote = review_page.css("h3")[0].children.text
 binding.pry

      #add this review to destination.reviews
  #    destination_object.reviews << ro

  destination_object.add_review(ro)

#    previews[0...6].each do |preview|

    #  best_of_city = {
    #    name: review_page.css("h3")[0].children.text ,
    #    url_b: review_page.css("h3 a")[0].attributes['href'].value ,
    #  }
#review = Travelo::Review.new(best_of_city)


    end

    end



end
