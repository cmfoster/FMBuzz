class CreatePlaylistables < ActiveRecord::Migration
  def change
    create_table :playlistables do |t|
      t.integer :playlist_id
      t.integer :song_id

      t.timestamps
    end
  end
end
