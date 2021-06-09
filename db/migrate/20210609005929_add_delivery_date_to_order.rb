class AddDeliveryDateToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :delivery_date, foreign_key: true
  end
end
