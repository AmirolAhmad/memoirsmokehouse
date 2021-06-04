class AddPromoCodeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :promocode, :string
  end
end
