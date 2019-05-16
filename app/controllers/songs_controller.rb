class SongsController < ApplicationController
    set :views, 'app/views/songs'

    get '/songs' do
        @songs = Song.all
    erb :index
    end

    get '/songs/new' do 
        @songs = Song.all
        erb :new
    end 

    post '/songs' do 
        @genres = Genre.all.map { |genre| genre.name}
        @artist = Artist.create(name: params[:artist_name])
        @song = Song.create(name: params[:name], artist_id: @artist.id)
        erb :new
    end 

    get '/songs/:slug' do
        @song.find_by_slug { |song| song.slug == slug }
        erb :show
    end     

end