class Song

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist!=nil #unsure on this, needs review
    self.genre= genre if genre!=nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #adds artist to the artist.add_song method
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #adds genre to array if it does not exist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
end
