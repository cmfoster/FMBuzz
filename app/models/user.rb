class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :song_requests
  has_many :points
  has_many :questions
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user.update_attribute(:name, "#{data.first_name} #{data.last_name}") if user.name.nil?
      user
    else # Create a user with a stub password. 
      User.create!(
        :email => data.email, 
        :password => Devise.friendly_token[0,20],
        :name => data.first_name + " " + data.last_name
        ) 
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
  
  def point_record(show) #Locate current points record for show
    return record = points.find_by_show_id(show.id)
  end

end
