class AddShowIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :show_id, :integer
  end
end
