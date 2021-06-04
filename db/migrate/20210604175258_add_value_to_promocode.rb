class AddValueToPromocode < ActiveRecord::Migration[6.1]
  def change
    add_column :promocodes, :value_percent, :integer
    add_column :promocodes, :fixed_amount, :integer, precision: 8, scale: 2
  end
end
