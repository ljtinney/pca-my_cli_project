class Cli
  attr_reader :scraper

  def call
    greeting
    scrape_it
    game_on
    goodbye
  end

  def greeting
    puts "
    Hello! Welcome!
    Here are the top 25 Beatles songs.
    "
  end

  def scrape_it
    @scraper = Scraper.new
    scraper.scrape_songs
  end

  def start
    puts "Here are the top 25 Beatles songs.
    "
    BeatlesSong.all.each do |song|
      puts "#{song.rank}. #{song.title} #{song.release_year}"
    end
  end

  def make_selection
    puts "
    To learn more about The Beatles top 25 songs, " \
         "enter a number between 1 - 25
         "
  end

  def game_on
    start
    while true
      make_selection

      input = gets.strip.downcase
      if input == "exit"
        goodbye
        exit
      elsif input.to_i <= 0 || input.to_i > 25
        invalid_pick
        game_on
      else
        song = song_chosen(input.to_i)
        user_selection(song)
      end
    end
  end

  def song_chosen(input)
    BeatlesSong.find_by_rank(input)
  end

  def user_selection(pick)
    if pick.rank != 1
      scraper.scrape_info(pick)
    else
      scraper.scrape_special(pick)
    end
    puts pick.info
  end

  def invalid_pick
    sleep(1)
    puts "Yeah... that is not a number between 1 - 25,... " \
    "please choose a NUMBER between 1 - 25
    "
    sleep(1)
  end

  def goodbye
    sleep(1)
    puts "I appreciate you.
    Thank you for checking out the top 25 Beatles songs.
    "
    sleep(1)
  end
end

# clone the project
# run bundle
# run bin/run.rb