class AddLimitToPromocode < ActiveRecord::Migration[6.1]
  def change
    add_column :promocodes, :limit, :integer, default: 100
  end
end
