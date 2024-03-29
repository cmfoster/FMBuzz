class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email, :message => "Email address is already subscribed"
  validates_format_of :email, :with =>  /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
end	
