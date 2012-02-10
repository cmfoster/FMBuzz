class CreateSongRequests < ActiveRecord::Migration
  def change
    create_table :song_requests do |t|
      t.integer :song_id
      t.integer :user_id
      t.integer :show_id
      t.integer :hitcount

      t.timestamps
    end
  end
end
