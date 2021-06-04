class AddQuantityToOrderMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :order_menus, :quantity, :integer
    remove_column :order_menus, :total_price
  end
end
