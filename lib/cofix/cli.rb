class Cofix::CLI
  attr_accessor :sorted_destinations

  def start
    puts "Welcome to Cofix! A gem that list the best coffee shop, from a list of 10 popular cities in the US".colorize(:yellow)
    puts "Where would you like to discover the top coffee shop today?"
    Cofix::Scraper.scrape_destinations
    #scrape the destinations - call scraper class
    sort_destinations
    #list 10 destinations
    list_destinations
    puts "Please select city you want to find its best coffee shop, by choosing a number from 1-10:"
    get_destination_method
  end

  def sort_destinations
    @sorted_destinations = Cofix::Destination.all.sort_by{|destination| destination.title}
  end

  def list_destinations
    @sorted_destinations.each.with_index(1) do |destination, index|
    puts "#{index}. #{destination.title}"
      end
  end

# this method has a loop format, recursion = it calls itself
  def get_destination_method
    input = gets.strip
    until input.to_i.between?(0,9) || input == "exit"
      puts "Sorry! invalid input"
    input = gets.strip
  end
  if input != "exit"
   index =  input.to_i - 1
    destination = @sorted_destinations[index]
    puts "#{destination.title}:"
    want_more_info(destination)
    puts "Please select city you want to explore it's coffee shops, by choosing a number 1-10 or type 'exit' to Exit ".colorize(:orange)
    get_destination_method
  end
end

  def want_more_info(destination)
    puts "Read more?"
    input = nil
    until ["Y","YES","N","NO"].include?(input)
      puts "type Y or N"
      input = gets.strip.upcase
    end
    if input == "Y" || input == "YES"
      puts "...Fetching the reviews\n"
      Cofix::Scraper.scrape_reviews(destination)

      destination.reviews.each do |review|
        puts "#{review.quote} found in #{review.link}.\n\n".colorize(:pink)
      end
    else
    puts "you ended"
    end
  end

  def list_preview
    #if movie details have NOT been scraped,
    #scrape
  end


end
