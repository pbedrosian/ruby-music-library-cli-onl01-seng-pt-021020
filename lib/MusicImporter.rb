class MusicImporter

  attr_accessor :path

  def initialize(path) #this sets the directory path for our MP3 files
    @path = path #path == "./spec/fixtures/mp3s"
  end


  #using the path we have taken in, we would use Dir.entries to naviate to that path, then we would iterate over the enteries and retuen an array of files that end with .mp3
  def files
      Dir.entries(path).select{|file| file.end_with?(".mp3")}
  end

  def new_from_filename
    files.each {|new_file| Song.new_from_filename(new_file)}
  end

end
