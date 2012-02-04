class AddPlaylistIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :playlist_id, :integer
  end
end
