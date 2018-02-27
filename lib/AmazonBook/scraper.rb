require 'open-uri'
class AmazonBook::Scraper

  BASE_PATH = "./././fixtures/"
  def self.scrape_list_page #returns a list of books
    doc = Nokogiri::HTML(open("./././fixtures/booklist.html"))
    book_list = [] #should return [{:name => "Harry Potter", :author => JK Rowling}]
    doc.css("#zg_centerListWrapper .zg_itemWrapper").each_with_index do |a,i|
      book_list [i] = {}
      book_list[i][:name] = "#{a.css("a div").children.attr('alt').value}"
    end
  end

  def self.scrape_book_page(url) #add attributes to book objects
    #scrape book page's url
    #should return {:name => Harry Potter, :author => JK Rowling, :review => 4.9 out of 5.0...}
  end
end
