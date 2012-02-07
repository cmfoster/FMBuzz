class PlaylistsController < ApplicationController
  
  def create
    @playlist = current_show.playlists.create(params[:playlist])
    @playlist.process
    
    respond_to do |format|
      format.html { redirect_to show_dashboard_path(current_show, @playlist) }
    end
  end
  
  def show

  end
end
