class Artist

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

  def self.list_all
    self.all.each_with_index do | artist, i |
      puts "#{i+1}. #{artist.name}"
    end
  end

  def save
    @@all << self
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.set_artist = self
  end

  def genres
    songs.collect { | song | song.genre }.uniq
  end

end
