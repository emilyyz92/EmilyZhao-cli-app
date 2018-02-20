class AmazonBook::CLI
  def start
    puts "Welcome to Amazon Book Best Sellers Gem! Please enter the number of top Amazon books you'd like to see on the list:"
    input = gets.strip
    if input.to_i.is_a? Integer
      puts "Printing a list of #{input} books:"
      AmazonBook::Scraper.scrape_list_page(input.to_i)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end

    puts "Would you like to learn any of the books in the list? Enter number of book, or exit."
    input_1 = gets.strip
    if input_1.to_i.is_a? Integer
      booklist(input_1)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end
  end

  def booklist(number)
    AmazonBook::Scraper.scrape_book_page(number) #below is what this should look like
    puts "Book Name: Harry Potter"
    puts "Review: 4 stars"
    puts "Author: JK Rowling"
    puts "Lanuage: English"
    puts "Availability: In Stock"
    puts "Price: $10.99"
    puts "Cover: paper cover"
  end


end
