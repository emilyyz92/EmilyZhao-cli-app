class AmazonBook::book
  attr_accessor :url, :name, :number_of_review, :author, :language, :availability, :price, :cover

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end
end
