class CreatePromocodes < ActiveRecord::Migration[6.1]
  def change
    create_table :promocodes do |t|
      t.string :code
      t.datetime :expired_at
      t.integer :status, null: false, default: 0
      t.integer :count, default: 0

      t.timestamps
    end

    add_index :promocodes, :code,                unique: true
  end
end
