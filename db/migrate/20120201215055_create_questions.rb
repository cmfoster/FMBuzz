class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :q
      t.integer :show_id

      t.timestamps
    end
  end
end
