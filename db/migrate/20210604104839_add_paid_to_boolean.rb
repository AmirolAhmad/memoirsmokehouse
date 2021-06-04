class AddPaidToBoolean < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :paid, :boolean, default: false
  end
end
