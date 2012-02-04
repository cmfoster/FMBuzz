class Artist < ActiveRecord::Base
  before_save {|artist| artist.name = artist.name.downcase}
  has_many :songs
  belongs_to :playlist
  validates_presence_of :name
end
