class RenameAuthorIdToUserIdInBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :author_id, :user_id
  end
end
