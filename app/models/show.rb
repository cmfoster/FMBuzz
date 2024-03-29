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
  has_many :song_requests
  has_many :points
  belongs_to :location
  
  def playlist_songs
    songs = []
    self.playlists.each do |playlist|
      playlist.songs.uniq.each do|song|
	songs << song.clone
      end
    end
    return songs
  end
  
  def playlist_artists
    artists = []
    self.playlists.each do |playlist|
      artists << playlist.artists
    end
    return artists.flatten!
  end
  
  def self.active
    where('? BETWEEN start_time AND end_time', Time.now)
  end
  
  def active
    if self.start_time? && self.end_time?
     Time.now >= self.start_time && Time.now <= self.end_time
    end
  end
  
  def toporder #changed to grab all questions made within the past 24 hours
    q = self.questions.where(:created_at => 24.hours.ago..Time.now)
    return q.sort{|a1, a2| a2.likes.size <=> a1.likes.size}
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"]).group_by(&:location)
    else
      find(:all)
      {:status => 'We werent able to find that station but here are some that should interest you'}
    end
  end
  
  def modulation #Checker method to filter whether AM, FM, or both 
    a = "AM" if am? 
    f = "FM" if fm?
    both = "FM & AM" if fm != false && fm == am 
    return result = both || a || f
  end
  
  def user_rank(point_record) #Find user rank
    rank = points.index(point_record) + 1
    return rank
  end
  
end
