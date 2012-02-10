class SongRequest < ActiveRecord::Base
  has_many :request_ips
  belongs_to :show
  belongs_to :user
  belongs_to :song
  
  validates_presence_of :song_id, :show_id
  
  def self.request_song(params)
      show = Show.find_by_id(params[:song_request][:show_id])
      song = Song.find_by_id(params[:song_request][:song_id])
      
      return {:status => 'Song Not Valid'} unless show && song
      
      ip = params[:ip]
      user = params[:user] || user = User.find(3) #user 3 is anonymous account
      
      songrequest = SongRequest.find_by_show_id_and_song_id(show.id, song.id)
      
      songrequest ?
	update_request(songrequest, show, song, ip, user) : new_request(show, song, ip, user)
  end
  
  def self.new_request(show, song, ip, user)
    request_ip = RequestIp.find(:all, :conditions => ["ip = ? and created_at > ?", ip, Time.now-60.minutes])
    if request_ip.count >= 5 && user.id == 3
      {:status => 'Sorry, as a non-registered user you are limited to one request per hour'}
    else
      song_request = SongRequest.create(
	:song_id => song.id,
	:user_id => user.id,
	:show_id => show.id,
	:hitcount => 1
      )
      if song_request.save
	song_request.request_ips.create(:ip => ip)
	{:status => 'Song Requested *Created*'}
      end
    end
  end
  
  def self.update_request(songrequest, show, song, ip, user)
    request_ip = RequestIp.find(:all, :conditions => ["ip = ? and created_at > ?", ip, Time.now-60.minutes])
    if request_ip.count >= 5 && user.id == 3
      {:status => 'Sorry, as a non-registered user you are limited to one request per hour'}
    else
      request_ip = songrequest.request_ips.find_by_ip(ip)
      songrequest.hitcount = songrequest.request_ips.group('ip').uniq.count unless request_ip #unless can reduce load from polling DB
      songrequest.request_ips.create!(:ip => ip) unless request_ip
      {:status => 'Song Requested but not really'}
    end
  end
end
