class Promocode < ApplicationRecord
  enum status: %i[inactive active expired]
  
  after_create :set_status

  def set_status
    if self.expired_at > Time.zone.now
      self.update_attribute(:status, 1)
    end
  end
end
