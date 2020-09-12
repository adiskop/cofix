class Travelo::Destination

  attr_accessor :title,:url,:read_time

@@all = []

  def initialize(att_hash)
    @title = att_hash[:title]
    @title = att_hash[:url]
    @title = att_hash[:read_time]

    att_hash.each do |key, value|
      self.send("#{key}=", value)
    end
self.save
    end

def save
@@all << self
self
end

def self.all
@@all  
end


end
