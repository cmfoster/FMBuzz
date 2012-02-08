class ApplicationController < ActionController::Base
  protect_from_forgery
  

  def after_sign_in_path_for(resource)
    if current_show
      show_dashboard_path(current_show.id) 
    else
      root_path if current_user
    end
  end

end
