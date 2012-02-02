class ApplicationController < ActionController::Base
  protect_from_forgery
  

  def after_sign_in_path_for(resource)
    show_dashboard_path(current_show) if current_show
  end

end
