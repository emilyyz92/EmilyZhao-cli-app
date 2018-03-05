class AmazonBook::Book
  attr_accessor :url, :name, :review, :author, :availability, :price, :publisher

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.create_from_list(book_array)
    book_array.each do |book|
      self.new(book[:name],book[:url])
    end
  end

  def add_attributes(book_hash)
    @review = book_hash[:review]
    @author = book_hash[:author]
    @price = book_hash[:price]
    @availability = book_hash[:availability]
    @publisher = book_hash[:publisher]
  end

  def self.all
    @@all
  end

end
