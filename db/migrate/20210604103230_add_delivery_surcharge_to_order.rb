class AddDeliverySurchargeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_surcharge, :string, precision: 8, scale: 2
  end
end
