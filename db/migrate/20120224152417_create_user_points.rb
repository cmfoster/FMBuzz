class CreateUserPoints < ActiveRecord::Migration
  def change
    create_table :user_points do |t|
      t.integer :user_id
      t.integer :point_group_id

      t.timestamps
    end
  end
end
