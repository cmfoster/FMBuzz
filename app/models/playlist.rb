class Playlist < ActiveRecord::Base
  has_many :playlistables
  has_many :songs, :through => :playlistables
end
