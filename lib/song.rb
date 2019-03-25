require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end



  def self.create
    new_instance = new
    new_instance.save
    new_instance
  end

  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

 def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ").last.split(".").first
    artist_name = filename.split(" - ").first
    song = self.new(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end

    def save
    @@all << self
  end
end
