class AddSummaryToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :summary, :text
  end
end
