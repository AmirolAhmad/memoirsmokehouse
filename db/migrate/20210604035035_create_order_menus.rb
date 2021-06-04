class CreateOrderMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :order_menus do |t|
      t.references :order, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.string :total_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
