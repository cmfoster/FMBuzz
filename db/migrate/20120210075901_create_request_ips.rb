class CreateRequestIps < ActiveRecord::Migration
  def change
    create_table :request_ips do |t|
      t.string :ip
      t.integer :song_request_id

      t.timestamps
    end
  end
end
