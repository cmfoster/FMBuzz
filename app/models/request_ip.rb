class RequestIp < ActiveRecord::Base
  belongs_to :song_request
  validates_presence_of :ip
end
