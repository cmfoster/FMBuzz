class SubscribersController < ApplicationController
  respond_to :js
  
  def create
    subscriber = Subscriber.create(params[:subscriber])
    if result = request.location && result != nil
      subscriber.city = result[0].city if result[0].city
      subscriber.state = result[1].state if result[0].state
    end
    if subscriber.save
      respond_with {flash[:notice] = "You are subscribed!"}
    end    
  end
end
