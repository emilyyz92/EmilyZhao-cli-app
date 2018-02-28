class AmazonBook::Book
  attr_accessor :url, :name, :review, :author, :language, :availability, :price, :cover

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.create_from_list(book_array)
    book_array.each do |book|
      Book.new(book[:name],book[:url])
    end
  end

  def add_attributes(book_hash)
    @name = book_hash[:name]
    @review = book_hash[:review]
    @url = book_hash[:url]
    @author = book_hash[:author]

  end

  def self.all
    @@all
  end

end
