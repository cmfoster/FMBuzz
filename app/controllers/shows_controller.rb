class ShowsController < ApplicationController
  respond_to :html, :js
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
    @show = current_show
    @playlist = @show.playlists.build
    @city = Location.find_by_city(params[:city])
    @locations = Location.all
    @messages = current_show.messages(:order => 'created_at DESC')
  end
  
  def edit
    
  end
  
end
