class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :favstation
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
