class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :fullname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.references :state, null: false, foreign_key: true
      t.string :phone_number
      t.string :delivery_method
      t.integer :status, null: false, default: 0
      t.decimal :total_price, precision: 8, scale: 2
      t.string :orderid

      t.timestamps
    end
  end
end
