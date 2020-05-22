# This class is responsible for communication with th user.
# This is where I will use 'puts'
# This will never use nokogiri
# This will have invoke Scraper

class  Cli
  attr_reader :scraper
  def call
    hello
    start
    make_selection
    game_on

        # gets the user input (an id)
    # finding the particular song
    # doing your second scrape to get the description
  end

  def hello
    puts "Hello! Welcome!"
  end

  def start
    puts "Here are the top 25 Beatles songs."
    @scraper = Scraper.new
    scraper.scrape_songs
    BeatlesSong.all.each do |song|
      puts "#{song.rank}. #{song.title} #{song.release_year}"
    end
  end

  def make_selection
    puts "To learn more about The Beatles top 25 songs, " \
         "enter a number between 1 - 25"
  end

  def game_on
    input = gets.strip.downcase
    if input == "exit"
      goodbye
      exit
    elsif input.to_i <= 0 || input.to_i > 25
      puts "Yeah... that is not a number between 1 - 25,... " \
           "please choose a NUMBER between 1 - 25"
      game_on
    else
      song = song_chosen(input.to_i)
      user_selection(song)
    end
  end

  def song_chosen(input)
    BeatlesSong.find_by_rank(input)
  end

  def user_selection(pick)
    scraper.scrape_song(pick)
    puts pick.info
    # puts "You chose #{pick.rank}. #{pick.title} #{pick.release_year}"
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
