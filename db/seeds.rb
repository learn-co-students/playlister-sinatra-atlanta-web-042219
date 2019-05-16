Artist.destroy_all
Song.destroy_all
Genre.destroy_all
SongGenre.destroy_all
#...

kanye = Artist.create(name: "Kanye West")
kanye.songs.create(name: "Homecoming").genres.find_or_create_by(name: "Rap")
kanye.songs.create(name: "Good Morning").genres.find_or_create_by(name: "Rap")

swift = Artist.create(name: "Taylor Swift")
swift.songs.create(name: "Love Story").genres.create(name: "Pop")
