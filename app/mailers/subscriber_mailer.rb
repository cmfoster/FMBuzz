class SubscriberMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def subscriber_email(subscriber)
    @subscriber = subscriber
    @url = "http://www.fmbuzz.com"
    mail(:to => subscriber.email, :subject => "Test")
  end
end
