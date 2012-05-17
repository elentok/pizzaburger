class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client
      t.string :toppings
      t.integer :amount

      t.timestamps
    end
    add_index :orders, :client_id
  end
end
