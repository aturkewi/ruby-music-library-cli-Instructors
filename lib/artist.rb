class Artist

  attr_accessor :name

  @@all ||= []

  def initialize(name)
    @name = name
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

end
