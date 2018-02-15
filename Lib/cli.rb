class AmazonBook::CLI
  def start
    puts "Welcome to Amazon Book Best Sellers Gem! Please enter the number of top books you'd like to see on the list:"
    input = gets.strip
    if input.to_i.is_a? Integer
      puts "Printing a list of books:"
    elsif input.downcase == "exit"
      puts "Thank you and hope to see you again!"
    else
      puts "Input invalid. Please input an integer or type exit."
    end
  end


end
