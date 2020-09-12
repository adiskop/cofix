class Travelo::CLI

  def start
    puts "Welcome to Travelo!"
    puts "Here are the top 50 destinations:"
    Travelo::Scraper.scrape_destinations
    #scrape the destinations - call to the scraper class
    #list top 50 destinations
    list_destinations
    #ask for input
    #call another method
  end

def list_destinations
  Travelo::Destination.all.each.with_index(1) do |destination, index|
    puts "#{index}. #{destination.title}"
  end
end

def list_review
  #if movie details have NOT been scraped,
  #scrape
end


end
