class SongRequestsController < ApplicationController
  
  def create
    if current_user
      opts = params.merge!(
	:ip => request.remote_ip,
	:user => current_user      
      ) 
    else
      opts = params.merge!(
	  :ip => request.remote_ip
      )
    end    
    rspnd = SongRequest.request_song(opts)
    flash[:notice] = rspnd[:status]
    redirect_to :back      
  end
end
  