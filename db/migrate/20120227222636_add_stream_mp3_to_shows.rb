class AddStreamMp3ToShows < ActiveRecord::Migration
  def change
    add_column :shows, :stream_mp3, :string
  end
end
