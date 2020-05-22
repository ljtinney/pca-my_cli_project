# This is the responsible for the blueprint of the domain object, in this case Beatles.
# This will never use Nokogiri
# It will never use puts
# It will store all of the Beatles instanec data attributes & do anything else I might need the Beatles to do.

class BeatlesSong
  attr_reader :rank, :title, :release_year
  attr_accessor :info

  @@all = []

  def initialize(title, release_year)
    @title = title
    @release_year = release_year
    @@all << self
    @rank = @@all.size
  end

  def self.all
    @@all
  end

  def self.find_by_rank(rank)
    all.find do |song|
      song.rank == rank
    end
  end
end
