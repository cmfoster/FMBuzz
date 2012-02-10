class Song < ActiveRecord::Base
#   validates_presence_of :title

  belongs_to :artist
  has_many :playlistables
  has_many :playlists, :through => :playlistables
  validates_presence_of :title
  validates_uniqueness_of :title
  
  def artist_with_title
    "#{artist.name.titleize} - #{title}"
  end
  
  # TODO not obvious what method does
  def self.handle_artist(artist)
    artist = artist.downcase
    artist_model = Artist.find_by_name(artist)
    if !artist_model
      artists = Artist.all.map{|a| a.name}
      
      artists.each do |a|
        if a.gsub(/[^[:alpha:]]/, '') == artist.gsub(/[^[:alpha:]]/, '') 
          handle_artist_name(artist)
          return Artist.find_by_name(a)
        end
      end

      artist_model = Artist.create(:name => artist)

    end
    handle_artist_name(artist)
    artist_model.save
    artist_model
  end

  # TODO not obvious what method does
  def self.handle_artist_name(name)
    name_model = ArtistName.find_by_name(name)
    if name_model
      name_model.count += 1
    else
      name_model = ArtistName.create(:name => name, :count => 1)
    end
    name_model.save
    name_model
  end

end
