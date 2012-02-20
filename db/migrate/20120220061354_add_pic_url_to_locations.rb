class AddPicUrlToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :picurl, :string
  end
end
