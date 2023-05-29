class SampleNameChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:books, :published, :string)
  end
end
