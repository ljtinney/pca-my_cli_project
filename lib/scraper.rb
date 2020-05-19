# This is responsibilie for scraping my web page(s)
# This file will use nokogiri, i.e. scrape.
# This file wil never use puts.

# Doc = Nokogiri::HTML(HTTParty.get(URL).body) 

# doc = Nokogiri::HTML(HTTParty.get(https://www.liveabout.com/top-beatles-songs-4058717).body) 

# unparsed_page = HTTParty.get(url)     @parsed_page = Nokogiri::HTML(unparsed_page) Nokogiri::HTML(HTTParty.get(url))

# html = open("https://www.liveabout.com/top-beatles-songs-4058717")
# doc = Nokogiri::HTML(html)

# doc = Nokogiri::HTML(open("https://www.liveabout.com/top-beatles-songs-4058717"))

class Scraper
  BASE_URL = "https://www.liveabout.com/top-beatles-songs-4058717"

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get(BASE_URL).body) 
  end


  def scape_rank

    doc.css(<div class="item-number">01</div>)

    puts doc.css(<div class="item-number">01</div>).text
  end


  def scrape_song_name

    doc.css(<span class="mntl-sc-block-heading__text"> "She Loves You" (1963) </span>).text

  end


  def scrape_release_year

    doc.css(<span class="mntl-sc-block-heading__text"> "She Loves You" (1963) </span>).text

  end


  def scrape_peak_position
    # This one is going to be tricky.
    # Since each of the songs do not list their peak billboard position in the same spot.
    # They're all listed somewhere in ONE OF THE PARAGRAPHs about the song.
      # Unfortunately, for each song, it's not one single paragraph...
        # They're divided into separate paragraph elements
        # It looks like they're typically listed in the last paragraph for each song description...
        # Might have to approach this one like... if it isn't located in the last paragraph, search other remaining paragraphs.
        # Might have to search for it using various strings or search by "#" & the lowest integer.
          # This is because in certain paragraphs they mention more than one billboard position; to find peak, you would have to tell it to look or the lowest integer in a paragraph.

    doc.css()

  end


  # BONUS??
  # def scrape_image

  #   <div class="img-placeholder"

  #   <img data-srcset="https://www.liveabout.com/thmb/pZdcpqIPkcWfGjmWKDRWlfmURgw=/300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 300w, https://www.liveabout.com/thmb/5w-5Q1QRc5Zx5mul0RRdBOzTrs0=/481x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 481w, https://www.liveabout.com/thmb/FMA7OzrAwzXOJ58Rh3gQxE2KFFg=/662x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 662w, https://www.liveabout.com/thmb/DY3n3K7g-XcE7HFHharfgx2Xvj0=/1024x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 1024w" data-src="https://www.liveabout.com/thmb/yMxJCpIhgP_CJE51nnNaXpru0vM=/1026x1024/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg" src="https://www.liveabout.com/thmb/yMxJCpIhgP_CJE51nnNaXpru0vM=/1026x1024/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg" alt="Beatles She Loves You" class=" lazyloaded" data-click-tracked="true" data-caption="" data-img-lightbox="true" data-expand="300" id="mntl-sc-block-image_2-0-1" data-owner="Courtesy Swan" data-tracking-container="true" srcset="https://www.liveabout.com/thmb/pZdcpqIPkcWfGjmWKDRWlfmURgw=/300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 300w, https://www.liveabout.com/thmb/5w-5Q1QRc5Zx5mul0RRdBOzTrs0=/481x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 481w, https://www.liveabout.com/thmb/FMA7OzrAwzXOJ58Rh3gQxE2KFFg=/662x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 662w, https://www.liveabout.com/thmb/DY3n3K7g-XcE7HFHharfgx2Xvj0=/1024x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/beatles-she-love-you-5772beca3df78cb62ca1b902.jpg 1024w">

  # end


end

