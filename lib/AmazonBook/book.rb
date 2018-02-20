class AmazonBook::Book
  attr_accessor :url, :name, :number_of_review, :author, :language, :availability, :price, :cover

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def create_from_list
  end

  def add_attributes
  end
end
