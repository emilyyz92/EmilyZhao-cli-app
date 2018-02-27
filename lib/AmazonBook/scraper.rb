require 'open-uri'
class AmazonBook::Scraper

  BASE_PATH = "./././fixtures/"
  def self.scrape_list_page #returns a list of books
    doc = Nokogiri::HTML(open("./././fixtures/booklist.html"))
    book_list = [] #should return [{:name => "Harry Potter", :url => "www.harrypotter.com"},{:name => "Winnie the Pooh", :url => "www.pooh.com"}]
    doc.css("#zg_centerListWrapper .zg_itemWrapper").each_with_index do |a,i|
      binding.pry
      book_list [i] = {}
      book_list[i][:name] = "#{a.css("a div").children.attr('alt').value}"
      book_list[i][:url] = a.css("a").attr('href').value
    end
    book_list
  end

  def self.scrape_book_page(url) #add attributes to book objects
    #scrape book page's url
    #should return {:name => Harry Potter, :author => JK Rowling, :review => 4.9 out of 5.0...}
  end
end
