class AmazonBook::Book
  attr_accessor :url, :name, :review, :author, :language, :availability, :price, :cover

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def create_from_list(booklist_array = AmazonBook::Scraper.scrape_book_page)
    book_array.each do |book|
      Book.new(book[:name],book[:url])
    end
  end

  def add_attributes(book_array)
    @name = book_array[:name]
    @review = book_array[:review]
    @url = book_array[:url]
    @author = book_array[:author]

  end

  def self.all
    @@all
  end

end
