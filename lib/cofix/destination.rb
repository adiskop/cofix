class Cofix::Destination

  attr_accessor :title,:url,:read_time
  attr_reader :tops

  @@all = []

  def initialize(att_hash)
#Below each-send method - could have been replaced like this:    
#@title = att_hash[:title]
#@url = att_hash[:url]
#@read_time = att_hash[:read_time]
    att_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @tops = []
    self.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def add_top(to)
    @tops<<to
    to.destination = self
  end

end
