# This class is responsible for communication with th user.
# This is where I will use 'puts'
# This will never use nokogiri
# This will have invoke Scraper

class  Cli
  def call
    hello
    start
    grab_input
  end

  def hello
    puts "Hello! Welcome!"
  end

  def start
    puts "Here are the top 25 Beatles songs."
    scraper = Scraper.new
    scraper.scrape_songs
    BeatlesSong.all.each do |song|
      puts "#{song.rank}. #{song.title} #{song.release_year}"
    end
    # gets the user input (an id)
    # finding the particular song
    # doing your second scrape to get the description
  end

  def grab_input
    puts "To learn more about The Beatles top 25 songs, " \
         "enter a number between 1 - 25"
    input = gets.chomp
  end



  def game_on
  # user_input = gets.strip.downcase
  #     if input == "exit" || "bye" || "goodbye" || "quit"
  #       goodbye
  #       exit
  #     elsif user_input.to_i <= 0
  #       puts "Yeah... that is a number between 1 - 25,... please choose a NUMBER between 1 - 25"
  #     elsif user_input.in 1..25
  #       input_to_index
  #       # recall_song method, yet to be written.
  #     end
  #   end
  end


# Scraper Method for puts out which Beatles song they choose based on their integer input
# will need input chomp situation

# if index.between?(0,8)

# input = gets.strip Input.to_i unless input == “exit” 

#   def turn
#     puts "Please choose a number between 1 - 25"
#     user_input = gets.chomp
#     index = input_to_index(user_input)
#     if valid_move?(index)
#       player_token = current_player
#       move(index, player_token)
#       display_board
#     else
#       turn
#     end
#   end

  def goodbye
    puts "Thank you for checking out the top 25 Beatles songs."
  end
end
