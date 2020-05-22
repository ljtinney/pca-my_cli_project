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




  def more?
# if they want more, it scrapes site for hyperlink & puts it out to them, which will take them to a Beatles video, or link to another site with more Beatles facts about individual Beatles...etc
    doc.css("comp list-marker list-marker--numbers").map {|section| section.text }

    doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block").css("item-number").map {|section| section.text }

    doc.css(".comp.mntl-sc-list-item.list-sc-item.mntl-block")

    #  doc.css(<div class="item-number">01</div>).text

     links = doc.css('div.heat a').map { |link| link['href'] }

    #  <div id="list-sc-item_1-0-3" gets us to the song block.
    #

  end


end