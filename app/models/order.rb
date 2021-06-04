class Order < ApplicationRecord
  belongs_to :state
  enum status: %i[received preparing delivering delivered]
end
