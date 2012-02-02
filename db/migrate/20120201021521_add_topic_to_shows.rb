class AddTopicToShows < ActiveRecord::Migration
  def change
    add_column :shows, :topic, :string
  end
end
