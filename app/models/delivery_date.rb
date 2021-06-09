class DeliveryDate < ApplicationRecord
  enum status: %i[active inactive]

  def custom_date
    date.strftime('%a, %d %b %Y')
  end
end
