require 'open-uri'
class AmazonBook::Scraper

  def self.scrape_list_page(number) #returns a list of books
    doc = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-books-Amazon/zgbs/books"))
    binding.pry
    book_list = {}
    doc.css("#zg_centerListWrapper").each_with_index do |a,i|
      book_list [i] = "#{i+1}. #{a.css("a").css("img").attr('alt').value} - "
    end

  end

  def self.scrape_book_page(number)
    #scrape book page's url
  end
end
