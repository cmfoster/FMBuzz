class ShowsController < ApplicationController
  respond_to :js, :html
  before_filter :authenticate_show!, :only => [:edit,:dashboard, :requests]
  
  def show
      @show = Show.find(params[:id])
      @messages = @show.messages
      @message = @show.messages.build
      @locations = Location.all
      @city = Location.find_by_city(params[:city])
      @questions = @show.toporder #def in showmodel
      @question = @show.questions.build
  end
  
#   Question Vote
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
    @show = Show.find_by_id(params[:show_id])
    @playlist = @show.playlists.build
    @city = Location.find_by_city(params[:city])
    @locations = Location.all
    @messages = @show.messages(:order => 'created_at DESC')
    @playlists = @show.playlists
    @requests = @show.song_requests.where('created_at BETWEEN ? AND ?', current_show.start_time ,current_show.end_time)
    @message = @show.messages.build
  end
  
    
  def modalplaylist
    @playlist = Playlist.find(params[:id])
    respond_with @playlist
  end
  
  def songlist
    if current_show && request.referer.scan('dashboard').size == 1
      @playlist = Playlist.find_by_id(params[:playlist_id])
      @artist = Artist.find_by_id(params[:artist_id])
      @artistsongs = Array.new
      @artist.songs.each do |song|
	@artistsongs << song unless @playlist.songs.where('id = ?', song.id) == false
      end
    else
      @show = Show.find_by_id(params[:show_id])
      allsongs = @show.playlist_songs
      @artist = Artist.find_by_id(params[:artist_id])
      @artistsongs = Array.new
      @artist.songs.each do |song|
	@artistsongs << song if allsongs.find{|s| s.id == song.id}
      end
    end
      respond_with @artistsongs
  end
  
  def requests
#     This has to be changed later, temporary.
    @requests = current_show.song_requests.where('created_at BETWEEN ? AND ?', current_show.start_time ,current_show.end_time)
    render :partial => 'partials/requestupdate'
  end
  
  def edit
    
  end
  
end
