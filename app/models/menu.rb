class Menu < ApplicationRecord
  has_many :order_menus, dependent: :destroy
  has_many :order, through: :order_menus
  enum status: %i[instock outofstock]

  STATUS_SELECTION = [
    ["In Stock", 'instock'],
    ["Out of Stock", 'outofstock']
  ]
end
