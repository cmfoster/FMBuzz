class Show < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :playlists
  has_many :messages
  has_many :questions
  belongs_to :location
  
  def self.active
    where('? BETWEEN start_time AND end_time', Time.now)
  end
  
  def active
     Time.now >= self.start_time && Time.now <= self.end_time
  end
  
  def toporder
    questions.sort{|a1, a2| a2.likes.size <=> a1.likes.size}
  end
  
end
