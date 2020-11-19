class Song

    attr_accessor :name, :artist

    @@all = [] 

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.new_by_filename(file_name)
        artist = file_name.split(' - ')[0]
        song = file_name.split(' - ')[1]
        new_song = Song.new(song)
        new_song.artist = Artist.new(artist)
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end
