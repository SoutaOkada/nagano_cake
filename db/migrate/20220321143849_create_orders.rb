class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :postage
      t.integer :payment
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
