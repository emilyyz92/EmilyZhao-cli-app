class AmazonBook::CLI

  def start
    puts "Welcome to Amazon Book Best Sellers Gem! Please enter the number of top Amazon books you'd like to see on the list:"

    input = gets.strip
    if input.to_i.is_a? Integer
      puts "Printing a list of #{input} books:"
      print_list(input)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end

    puts "Would you like to learn more on any of the books in the list? Enter the number of the book, or exit."

    input_1 = gets.strip
    if input_1.to_i.is_a? Integer && input_1.to_i < input.to_i
      print_attribute(input_1)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please try again or type exit."
    end
  end

  def print_list(number)
    AmazonBook::Scraper.scrape_list_page.each_with_index do |item, i|
      if i+1 <= number.to_i
        i_1 = i + 1
        puts "#{i_1}. #{item[:name]}"
      end
    end

    AmazonBook::Book.create_from_list(AmazonBook::Scraper.scrape_list_page)
  end

  def print_attribute(number) #below is what this should look like
    url = AmazonBook::Scraper.scrape_list_page[number.to_i - 1][:url]
    book = AmazonBook::Book.all.detect {|book| book.url == url}
    AmazonBook::Scraper.scrape_book_page(url)

    puts "Book Name: #{book.name}"
    puts "Review: #{book.review}"
    puts "Author: #{book.author}"
    puts "Availability: In Stock"
    puts "Price: $10.99"
    puts "Cover: paper cover"
  end

end
