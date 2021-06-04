class Order < ApplicationRecord
  belongs_to :state
  has_many :order_menus
  has_many :menu, through: :order_menus
  enum status: %i[received preparing delivering delivered]

  after_create :create_orderid
  after_create :create_totalprice

  def fulladdress
    "#{address1}, #{address2}, #{postcode} #{city}, #{state.name}"
  end

  def options_for_status
    [
      ['1','1'],
      ['2','2'],
      ['3','3'],
      ['4','4'],
      ['5','5']
    ]
  end

  def create_orderid
    random = ['1'..'9'].map { |i| i.to_a }.flatten
    ref_no = (0...6).map { random[rand(random.length)] }.join
    self.update_attribute(:orderid, "MSH-" + ref_no + Time.zone.now.year.to_s)
  end

  def create_totalprice
    if self.delivery_method == "Rider Delivery"
      if self.postcode == "42300" || "48010" || "47000"
        cal_delivery = 0
      else
        cal_delivery = 25
      end
    else
      cal_delivery = 0
    end
    a = self.menu.to_a.map {|x| x.price.to_i}.sum
    self.update_attribute(:total_price, a + cal_delivery)
  end
end
