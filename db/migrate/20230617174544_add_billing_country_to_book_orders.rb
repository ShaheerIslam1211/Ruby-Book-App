class AddBillingCountryToBookOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :book_orders, :billing_country, :string
  end
end
