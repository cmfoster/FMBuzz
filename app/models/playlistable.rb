class Playlistable < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song
  validates_presence_of :song_id, :playlist_id
end
