class Playlist < ActiveRecord::Base
  
  
  # Integrating playlists currently
  #TODO 
  #Need to create a through model for artist or add them to playlisables
  #This is to make sure artists can belong to multiple playlists
  #To avoid creating the same artists over and over again in the DB.
  
  require 'nokogiri'
  
  has_attached_file :m3u
  has_many :playlistables
  has_many :songs, :through => :playlistables
  belongs_to :show
  validates_presence_of :name 
  validates_uniqueness_of :name
  
  
  def process
    clear_playlist if self.playlistables.any?
    if self.m3u.path.last(5) == ".xspf"
      process_xspf
    else
      redirect_to :back
    end
  end

  #handle_asynchronously :process #Keep this, processing .nml files takes 5+ seconds.

  private

  def process_xspf
    doc =  Nokogiri::XML(open("#{self.m3u.path}"))
     tracks = doc.search('track')
     tracks.each do |track|
       a = Artist.find_by_name(track.search('creator').text.downcase) 
       if a 
	self.songs.create!(:artist_id => a.id, :title => track.search('title').text)
       else
	a = Artist.create!(:name => track.search('creator').text)
	self.songs.create!(:artist_id => a.id, :title => track.search('title').text)
       end
     end
     self.save!
  end
  
  # All code below this is not used

  def handle_artist(artist)
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

  def handle_artist_name(name)
    name_model = ArtistName.find_by_name(name)
    if name_model
      name_model.count += 1
    else
      name_model = ArtistName.create(:name => name, :count => 1)
    end
    name_model.save
    name_model
  end

  def clear_playlist
    self.playlistables.each do |p|
      p.song.destroy if p.song
      p.destroy
    end
  end

  def parse_name(name)
    return name.split(' - ');
  end

  def strip_junk(string)
    return if !string
    #fix dashes
    string.gsub!(/(\s+-\S|\S-\s)/, ' - ')
    #remove URLs
    string.gsub!(/(^|\s)\S*(.com|.net)\S*(\s|$)/, ' ')
    #change underscore to spaces
    string.gsub!('_', ' ')
    #remove extra spaces
    string.gsub!(/\s{2,}/, ' ')
    #remove bitrates
    string.gsub!(/[0-9]{2,3}kb/, '')
    #replace html notation apostrophes
    string.gsub!('&#39;', "'")
    #remove .mp3 at end of song title
    string.gsub(/.mp3|.Mp3|.MP3/, '')
  end

end
