class AddFmAndAmToShows < ActiveRecord::Migration
  def change
    add_column :shows, :fm, :boolean
    add_column :shows, :am, :boolean
  end
end
