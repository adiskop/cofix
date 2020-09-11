class Travelo::CLI

  def start
    puts "Welcome to Travelo!"
    puts "Here are the top 50 destinations:"
    #Travelo::Scraper.scrape_destinations
    #scrape the destinations - call to the scraper class
    #list top 50 destinations
    #list_review
    #ask for input
    #call another method
  end

def list_destination
  Travelo::Review.all.each.with_index(2) do |destination, index|
    puts "#{index}. #{destination.name}"
  end
end

def list_review
  #if movie details have NOT been scraped,
  #scrape
end


end
