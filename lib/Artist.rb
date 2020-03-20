require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == self #checks to see if song has an artist. If not, assigns artist to song
    else
      song.artist = self
    end

    songs << song unless songs.include?(song) #checks to see if song exist, then pushes the song to the array.

  end

  def genres
    self.songs.collect {|artist| artist.genre}.uniq #goes over the songs method and pulls the artists
  end
end
