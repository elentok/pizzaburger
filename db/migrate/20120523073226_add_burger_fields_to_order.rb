class AddBurgerFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :how_done, :string
    add_column :orders, :fries, :boolean
    add_column :orders, :type, :string
  end
end
