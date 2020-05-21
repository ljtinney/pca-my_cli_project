class Scraper
  BASE_URL = "https://www.liveabout.com/top-beatles-songs-4058717"

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get(BASE_URL).body)
  end

  def scrape_rank
    ranked_songs = []
    songs_list = doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block").css(".mntl-sc-block-heading__text").map {|section| section.text.split("\"").pop(2) }

    # songs_list[user_index] will give us the rank
    binding.pry

  end

  def scrape_song_name
    songs_list = doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block").css(".mntl-sc-block-heading__text").map {|section| section.text.split("\"").pop(2) }

    # songs_list[user_index][0] will puts out the song title.
  end

  def scrape_release_year
    songs_list = doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block").css(".mntl-sc-block-heading__text").map {|section| section.text }
    # songs_list[user_index][1] will puts out the year the song was released.
  end

  def more?

    doc.css("comp mntl-sc-block mntl-sc-block-html.a href")

  end


end