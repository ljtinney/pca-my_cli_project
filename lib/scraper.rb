class Scraper
  BASE_URL = "https://www.liveabout.com/top-beatles-songs-4058717"

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get(BASE_URL).body)
  end

  def scrape_songs
    doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block")
       .css(".mntl-sc-block-heading__text").each do |section|
      title, unparsed_year = section.text.split("\"").pop(2)
      # BONUS - year - clean up with string methods
      BeatlesSong.new(title, unparsed_year)
    end
  end

  def scrape_song(pick)
    pick.info = doc.css("#list-sc-item_1-0-#{pick.rank - 1}")
                   .css(".mntl-sc-block-html").text
  end


end