class Song < ActiveRecord::Base 
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug 
    if self.name.include?(" "|| "_")
        name.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
    end 
    
    self.find_by_slug(slug)
    Song.all.find{ |song| song.slug == slug }
    end 

end