class AddStationToShows < ActiveRecord::Migration
  def change
    add_column :shows, :station, :string
  end
end
