class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    str = file.chomp(".mp3").split(" - ")
    artist = str[0]
    title = str[1]
    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(file)
    str = file.chomp(".mp3").split(" - ")
    artist = str[0]
    title = str[1]
    song = self.new
    song.artist_name = artist
    song.name = title
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
