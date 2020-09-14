class Travelo::Destination

  attr_accessor :title,:url,:read_time
  attr_reader :reviews

@@all = []

  def initialize(att_hash)
  #  @title = att_hash[:title]
  #  @title = att_hash[:url]
  #  @title = att_hash[:read_time]

    att_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @reviews = []
    self.save
    end

def save
@@all << self
self
end

def self.all
@@all
end

def add_review(rev)
  @reviews<<rev
  rev.destination = self  

end


end
