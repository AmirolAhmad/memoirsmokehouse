class Menu < ApplicationRecord
  enum status: %i[instock outofstock]

  STATUS_SELECTION = [
    ["In Stock", 'instock'],
    ["Out of Stock", 'outofstock']
  ]
end
