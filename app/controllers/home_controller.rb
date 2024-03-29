class HomeController < ApplicationController
  respond_to :html, :js
  
  def index
#     redirect_to dashboard_dj_index_path if current_disk_jockey
#     ip = request_ip
#     @result = Geocoder.search(ip)
    @locations = Location.all
    @city = Location.find_by_id(params[:city])
  end
  
  def cityindex 
    @city = Location.find_by_city(params[:city]) # fill page with city specific content
    @shows = @city.shows #shows are the broadcasting accounts
    respond_with @shows
  end 
  
#   Set as root route for launch page
  def launch
    render :layout => 'launch'
    @result = request.location
  end
end
