class SubscribersController < ApplicationController
  respond_to :js
  
  def create
    subscriber = Subscriber.create(params[:subscriber])
    if result = request.location
      subscriber.city = result.city if result.city
      subscriber.state = result.state if result.state
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
  
  def contact_us
    SubscriberMailer.contact_us(params).deliver # if Rails.env.production?
    render :inline => "<div id='confirmation'><h3>You message has been sent.</h3><p>You should expect a response shortly.</p></div>".html_safe
  end
end
