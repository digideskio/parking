class BikeParkingSpot < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed? 

  def no_address?
    true if self.address == "No Exact Address"
  end

end