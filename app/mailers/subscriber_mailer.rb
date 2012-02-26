class SubscriberMailer < ActionMailer::Base
  default :from => "info@FMbuzz.com"
  
  def subscriber_email(subscriber)
    @subscriber = subscriber
    @url = "http://www.fmbuzz.com"
    mail(:to => subscriber.email, :subject => "Test")
  end
  
  def contact_us(params)
    @message = params[:message]
    @email = params[:email]
    mail(:to => "info@fmbuzz.com", :subject => "Contact Form")
  end
end
