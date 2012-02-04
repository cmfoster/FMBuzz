class Artist < ActiveRecord::Base
  before_save {|artist| artist.name = artist.name.downcase}
  has_many :songs
  validates_presence_of :name
end
