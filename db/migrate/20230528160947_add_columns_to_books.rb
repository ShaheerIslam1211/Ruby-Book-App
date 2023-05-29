class AddColumnsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :price, :decimal
    add_column :books, :published_date, :date
    add_column :books, :genre, :string
    add_column :books, :publisher, :string
    add_column :books, :language, :string
    add_column :books, :isbn, :string
  end
end
