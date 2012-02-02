class AddLocationIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :location_id, :integer
  end
end
