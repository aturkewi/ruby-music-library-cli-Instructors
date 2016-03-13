class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all ||= []

  def initialize(name, new_artist = nil, new_genre = nil)
    @name = name
    new_artist.add_song(self) if new_artist
    new_genre.add_song(self) if new_genre
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

  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    file_artist = Artist.find_or_create_by_name(song_array[0])
    file_genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3",""))
    new(song_array[1], file_artist, file_genre)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap { | s | s.save }
  end

  def save
    @@all << self
  end

  def set_artist=(artist)
    @artist = artist
  end

  def set_genre=(genre)
    @genre = genre
  end

  def artist=(artist_obj)
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    genre_obj.add_song(self)
  end

end
