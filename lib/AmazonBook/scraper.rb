require 'open-uri'
class AmazonBook::Scraper

  BASE_PATH = "./././fixtures/"

  def self.scrape_list_page #returns a list of books
    doc = Nokogiri::HTML(open("./././fixtures/booklist.html"))
    book_list = [] #should return [{:name => "Harry Potter", :url => "www.harrypotter.com"},{:name => "Winnie the Pooh", :url => "www.pooh.com"}]
    doc.css("#zg_centerListWrapper .zg_itemWrapper").each_with_index do |a,i|
      book_list [i] = {}
      book_list[i][:name] = "#{a.css("a div").children.attr('alt').value}"
      book_list[i][:url] = a.css("a").attr('href').value
    end

    book_list
  end

  def self.scrape_book_page(url) #add attributes to book objects
    #scrape book page's url
    #should return {:name => Harry Potter, :author => JK Rowling, :review => 4.9 out of 5.0...}
    book = AmazonBook::Book.all.detect {|book| book.url == url}
    doc = Nokogiri::HTML(open(url))
    book_hash = {}
    binding.pry
    book_hash[:author] = doc.css("#dp-container #centerCol #booksTitle #byline a").css(".contributorNameID").children.text
    book_hash[:review] = doc.css("#dp-container #centerCol #averageCustomerReviews_feature_div #averageCustomerReviews span span").attr("title").value
    book_hash[:price] = doc.css("#dp-container #centerCol #MediaMatrix #tmmSwatches ul li").css("a > span").text.split[1] #first price in the leftest box, usually the price of kindle version
    book_hash[:availability] = doc.css(".en_US #rightCol #buybox #availability").css("span").children.text.gsub("\n", "").squeeze(" ")
    # book_hash[:publisher]
    book.add_attributes(book_hash)
    book_hash
  end
end
