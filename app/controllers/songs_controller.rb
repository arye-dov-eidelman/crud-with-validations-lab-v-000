class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      # byebug
      redirect_to @song
    else
      render '/songs/new'
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      # byebug
      redirect_to @song
    else
      render '/songs/edit'
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
  
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end