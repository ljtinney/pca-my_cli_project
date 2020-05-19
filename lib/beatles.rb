# This is the responsible for the blueprint of the domain object, in this case Beatles.
# This will never use Nokogiri
# It will never use puts
# It will store all of the Beatles instanec data attributes & do anything else I might need the Beatles to do.

# doc = Nokogiri::HTML(HTTParty.get("https://www.liveabout.com/top-beatles-songs-4058717""))


class TopBeatlesSongs

  attr_reader :rank, :name, :release_year, :peak_position, :image

  @@all = []

  def initialize(rank = nil, name = nil, release_year = nil, peak_position = nil, image = nil)
    @rank = rank
    @name = name
    @release_year = release_year
    @peak_position = peak_position
    @image = image
    @@all << self
  end

  def self.all
    @@all
  end


end
