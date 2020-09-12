class Travelo::CLI
  attr_accessor :sorted_destinations

  def start
    puts "Welcome to Travelo! The app that takes you to a coffee journey in 10 US metropolises"
    puts "Where would you like to discover coffee shops today?"
    Travelo::Scraper.scrape_destinations
    sort_destinations
    #scrape the destinations - call to the scraper class
    #list top 10 destinations
    list_destinations
    get_destination_method
    #ask for input
    #call another method
  end

  def sort_destinations
    @sorted_destinations = Travelo::Destination.all.sort_by{|destination| destination.title}
  end

  def list_destinations
    @sorted_destinations.each.with_index(1) do |destination, index|
    puts "#{index}. #{destination.title}"
      end
  end

  def get_destination_method
    puts "Please select city you want to explore it's coffee shops, by choosing a number 1-10: "
    input = gets.strip

  end

  def list_review
    #if movie details have NOT been scraped,
    #scrape
  end


end
