class AddDeviseToShows < ActiveRecord::Migration
  def self.up
    change_table(:shows) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :shows, :email,                :unique => true
    add_index :shows, :reset_password_token, :unique => true
    # add_index :shows, :confirmation_token,   :unique => true
    # add_index :shows, :unlock_token,         :unique => true
    # add_index :shows, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
