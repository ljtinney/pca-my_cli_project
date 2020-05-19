# This class is responsible for communication with th user.
# This is where I will use 'puts'
# This will never use nokogiri
# This will have invoke Scraper

class  Cli
  attr_accessor
  binding.pry
  end


  # Use #welcome
  # Use #start


  def welcome
    puts "Welcome!"
  end

  def start
    puts "To learn more about The Beatles top 25 songs, enter a number between 1 - 25"
      # receives input from user

      # displays song rank, song title, & paragraphs about that particular song.
      # Bonus, maybe display the image too, depending on JavaScript stuff

      # Then puts, "to continue to learn about more top 25 Beatles songs, please enter another number between 1 - 25, if you're finshed please type the letter 'q' to quit"

      # Gets input from user.

      # Loop similar to the Music CLI lab, whre it continues on until the condition of user input of 'q' is met.

      # Once user inputs 'q', invoke the #goodbye method.

  end



# Scraper Method for puts out which Beatles song they choose based on their integer input
# will need input chomp situation


def goodbye
  puts "Thank you for checking out the top 25 Beatles songs."
end




end