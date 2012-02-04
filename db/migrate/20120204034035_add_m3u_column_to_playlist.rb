class AddM3uColumnToPlaylist < ActiveRecord::Migration
  def self.up
     add_column :playlists, :m3u_file_name,    :string
     add_column :playlists, :m3u_content_type, :string
     add_column :playlists, :m3u_file_size,    :integer
     add_column :playlists, :m3u_updated_at,   :datetime
  end

  def self.down
    remove_column :playlists, :m3u_file_name
    remove_column :playlists, :m3u_content_type
    remove_column :playlists, :m3u_file_size
    remove_column :playlists, :m3u_updated_at
  end
end
