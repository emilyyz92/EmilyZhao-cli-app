require 'open-uri'
class AmazonBook::Scraper

  def self.scrape_list_page #returns a list of books
    doc = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-books-Amazon/zgbs/books"))
    binding.pry
    book_list = [] #should return [{:name => "Harry Potter", :author => JK Rowling}]
    doc.css("#zg_centerListWrapper").each_with_index do |a,i|
      book_list [i] = {}
      binding.pry
      book_list[i][:name] = "#{a.css("#zg_itemImmersion").css("a div").text}"
    end
  end

  def self.scrape_book_page(url) #add attributes to book objects
    #scrape book page's url
    #should return {:name => Harry Potter, :author => JK Rowling, :review => 4.9 out of 5.0...}
  end
end
