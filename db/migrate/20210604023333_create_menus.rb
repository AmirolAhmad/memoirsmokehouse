class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :default_picture
      t.string :name
      t.text :desription
      t.string :weight
      t.string :price, precision: 8, scale: 2
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
