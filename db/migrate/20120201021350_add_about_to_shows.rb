class AddAboutToShows < ActiveRecord::Migration
  def change
    add_column :shows, :about, :text
  end
end
