class CreateBookOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :book_orders do |t|
      t.integer :book_id
      t.string :email
      t.integer :original_amount
      t.integer :final_amount
      t.integer :processing_fee
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_address_one
      t.string :billing_address_two
      t.string :billing_city
      t.string :billing_zipcode
      t.string :billing_state
      t.boolean :processed
      t.integer :transfer_amount
      t.string :stripe_transaction_token
      t.string :stripe_transfer_token
      t.string :stripe_session_id
      t.datetime :processed_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
