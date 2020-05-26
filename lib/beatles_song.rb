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
