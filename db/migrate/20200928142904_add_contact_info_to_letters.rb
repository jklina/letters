class AddContactInfoToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :name, :string
    add_column :letters, :email, :string
  end
end
