class HomeController < ApplicationController
  
  def index
#     redirect_to dashboard_dj_index_path if current_disk_jockey
#     ip = request_ip
#     @result = Geocoder.search(ip)
    @locations = Location.all
    @city = Location.find_by_city(params[:city])
  end
  
  def cityindex 
    @locations = Location.all #dropbox topbar
    @city = Location.find_by_city(params[:city]) # fill page with city specific content
    @shows = @city.shows #shows are the broadcasting accounts
    
  end 
end
