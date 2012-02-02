class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :show_id
      t.string :name

      t.timestamps
    end
  end
end
