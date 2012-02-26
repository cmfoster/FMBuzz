class AddQuestionsEnabledToShow < ActiveRecord::Migration
  def change
    add_column :shows, :questions_enabled, :boolean
  end
end
