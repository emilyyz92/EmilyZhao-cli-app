require 'open-uri'
class AmazonBook::list
  def open_url(url="https://www.amazon.com/best-sellers-books-Amazon/zgbs/books")
    doc = Nokogiri::HTML(open(url))
  end

  def self.scrape_list_page(number)
    open_url.css("#zg_paginationWrapper .p13n-sc-truncated").each do |abc|
      binding.pry
    end

  end

  def self.scrape_book_page(book_url)
  end
end
