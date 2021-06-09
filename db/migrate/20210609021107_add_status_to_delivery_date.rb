class AddStatusToDeliveryDate < ActiveRecord::Migration[6.1]
  def change
    add_column :delivery_dates, :status, :integer, null: false, default: 0
  end
end
