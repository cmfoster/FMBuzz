class ShowsController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_show!, :only => [:edit,:dashboard]
  
  def show
      @show = Show.find(params[:id])
      @messages = @show.messages
      @message = @show.messages.build
      @locations = Location.all
      @city = Location.find_by_city(params[:city])
      @questions = @show.toporder #def in showmodel
  end
  
  def vote
    @show = Show.find(params[:show_id])
    if params[:question]
      question = Question.find(params[:question])
      question.liked_by current_user if current_user && params[:vote] == 'up'
      question.disliked_by current_user if current_user && params[:vote] == 'down'
    end
    @questions = @show.questions
    respond_with @questions
  end
  
  def dashboard
    @show = Show.find_by_id(current_show.id)
    @playlist = @show.playlists.build
    @city = Location.find_by_city(params[:city])
    @locations = Location.all
    @messages = current_show.messages(:order => 'created_at DESC')
    @playlists = @show.playlists
  end
  
    
  def modalplaylist
    @playlist = Playlist.find(params[:id])
    respond_with @playlist
  end
  
  def songlist
    @playlist = Playlist.find_by_id(params[:playlist_id])
    @artist = Artist.find_by_id(params[:artist_id])
    @artistsongs = Array.new
    @artist.songs.each do |song|
      @artistsongs << song unless @playlist.songs.where('id = ?', song.id) == false
    end
    respond_with @artistsongs
  end
  
  def edit
    
  end
  
end
