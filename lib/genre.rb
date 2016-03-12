class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all ||= []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    self.new(name).tap { | a | a.save }
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.set_genre = self
  end

  def artists
    songs.collect { | song | song.artist }.uniq
  end

end
