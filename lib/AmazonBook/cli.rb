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

    puts "Would you like to learn more on any of the books in the list? Enter number of book, or exit."

    input_1 = gets.strip
    if input_1.to_i.is_a? Integer
      print_attribute(input_1)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end
  end

  def print_list(number)
    AmazonBook::Scraper.scrape_list_page.each_with_index do |item, i|
      i_1 = i + 1
      puts "#{i_1}. item[:name] - item[:author]"
    end
  end

  def print_attrbute(number) #below is what this should look like
    puts "Book Name: #{book_hash(number)[:name]}"
    puts "Review: #{book_hash(number)[:review]}"
    puts "Author: JK Rowling"
    puts "Lanuage: English"
    puts "Availability: In Stock"
    puts "Price: $10.99"
    puts "Cover: paper cover"
  end

  def book_hash(number) #take the hash from Scraper class and return the book item
    AmazonBook::Scraper[number.to_i - 1]
  end

end
