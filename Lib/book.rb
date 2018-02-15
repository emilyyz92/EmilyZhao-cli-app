class AmazonBook::book
  attr_accessor :url, :name, :number_of_review, :author, :publisher, :language, :availability, :price, :cover

  @@all = []

  def initialize
    @@all << self
  end
end
