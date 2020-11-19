class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        #path = ./spec/fixtures/mp3s
        #glob expands path/*.mp3 (array of mp3 files)
        files = Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "")} #gsub replaces pattern with second arg
    end

    def import 
        files.each {|song| Song.new_by_filename(song)}
    end

    
end
