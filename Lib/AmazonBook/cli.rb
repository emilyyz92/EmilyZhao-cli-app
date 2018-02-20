class AmazonBook::CLI
  def start
    puts "Welcome to Amazon Book Best Sellers Gem! Please enter the number of top Amazon books you'd like to see on the list:"
    input = gets.strip
    if input.to_i.is_a? Integer
      puts "Printing a list of #{input} books:"
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end

    puts "Would you like to learn any of the books in the list? Enter number of book, or exit."
    input_1 = gets.strip
    if input.to_i.is_a? Integer
      booklist(input_1)
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end
  end

  def booklist
    puts "Book Name: Harry Potter"
    puts "Review: 4 stars"
    puts "Author: JK Rowling"
    puts "Lanuage: English"
    puts "Availability: In Stock"
    puts "Price: $10.99"
    puts "Cover: Softcover"
  end


end
