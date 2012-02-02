class AddRequestsEnabledToShows < ActiveRecord::Migration
  def change
    add_column :shows, :requests_enabled, :boolean
  end
end
