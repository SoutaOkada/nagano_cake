class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :price
      t.integer :amount
      t.integer :status

      t.timestamps
    end
  end
end
