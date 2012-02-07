class Artist < ActiveRecord::Base
  before_save {|artist| artist.name = artist.name.downcase}
  has_many :songs, :dependent => :destroy
  validates_presence_of :name
  validates_uniqueness_of :name
end
