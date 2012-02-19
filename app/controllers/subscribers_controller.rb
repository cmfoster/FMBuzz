class SubscribersController < ApplicationController
  respond_to :js
  
  def create
    subscriber = Subscriber.create(params[:subscriber])
    if result = request.location && result != nil
      subscriber.city = result[0].city if result[0].city
      subscriber.state = result[1].state if result[0].state
    end
    if subscriber.save
      SubscriberMailer.subscriber_email(subscriber).deliver if Rails.env.production?
      respond_with {flash[:success] = "You are subscribed!"} 
    else if subscriber.errors.any?
      flash[:error] = subscriber.errors.full_messages.to_sentence
      respond_with {flash[:error]}
    end
  end
  end
end
