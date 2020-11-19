class Artist
    
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all.uniq 
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        songs = Song.all.collect {|song| song if song.artist == self}
        songs.compact
    end

    def self.find_or_create_by_name(name)
        @@all.each do |artist|
            if artist.name == name 
                return artist
            end
        end
        return Artist.new(name)
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end


end
