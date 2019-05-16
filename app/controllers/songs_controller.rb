class SongsController < ApplicationController

	get '/songs' do
		erb :'songs/index'
	end

	post '/songs' do
		new_song = Song.new(params[:song])
		new_song.artist = Artist.find_or_create_by(name: params[:artist_name]) 
		new_song.save
		session[:message] = "Successfully created song."
		redirect "/songs/#{new_song.slug}"
	end

	get '/songs/new' do
		erb :'songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@temp = session[:message]
		session[:message] = nil
		erb :'songs/show'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		params.delete(:_method)
		params.delete(:slug)

		@song.update(genre_ids: params[:genre_ids], artist: Artist.find_or_create_by(name: params[:artist_name]))
		
		session[:message] = "Successfully updated song."
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end
end
