class Cli
  attr_reader :scraper

  def call
    greeting
    scrape_it
    take_input
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

  def selection_notice
    puts "
    To learn more about The Beatles top 25 songs, " \
         "enter a number between 1 - 25
         "
  end

  def exit_program
    goodbye
    exit
  end

  def try_again
    invalid_pick
    take_input
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

  def capture_pick(input)
    song = song_chosen(input.to_i)
    user_selection(song)
  end

  def take_input
    start
    loop do
      selection_notice

      input = gets.strip.downcase
      if input == "exit" then exit_program
      elsif input.to_i <= 0 || input.to_i > 25 then try_again
      else
        capture_pick(input)
      end
    end
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
