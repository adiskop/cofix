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
    puts "Please select city you want to explore it's coffee shops, by choosing a number 1-10: "
    get_destination_method_in_loop_format    #asked for input and reported the title of destination
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
    input = gets.strip  #"A private war"  "exit"
    index = input.to_i - 1
      if index.between?(0,9)    #a string will be -1
      destination = @sorted_destinations[index]
      puts "#{destination.title}:"
        #continue with our program
        #find that destination
        #2nd scrape
        #list destination that corresponds to this number
        want_more_info(destination)
      elsif input == "exit"
        #allow this method to end
      else
        puts "Sorry! invalid input"
        get_destination_method    #recursion(calling the same method from inside the method)
      end
  end

  def get_destination_method_in_loop_format
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
    puts "Please select city you want to explore it's coffee shops, by choosing a number 1-10 or type 'exit' to Exit "
    get_destination_method_in_loop_format
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
      Travelo::Scraper.scrape_reviews(destination)

      destination.reviews.each do |review|
        puts "#{review.quote} found in #{review.link}.\n\n"
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
