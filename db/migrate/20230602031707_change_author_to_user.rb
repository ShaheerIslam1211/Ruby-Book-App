class ChangeAuthorToUser < ActiveRecord::Migration[7.0]
  def change
    rename_table :authors, :users

    add_column :users, :membership_type, :string
  end
end
