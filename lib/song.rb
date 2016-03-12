class Song

  attr_accessor :name
  attr_reader :artist

  @@all ||= []

  def initialize(name, new_artist = nil)
    @name = name
    new_artist.add_song(self) if new_artist
  end

  def self.create(name)
    Song.new(name).tap { | s | s.save }
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

  def set_artist=(artist)
    @artist = artist
  end

  def artist=(artist_obj)
    artist_obj.add_song(self)
  end

end
