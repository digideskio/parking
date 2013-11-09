class BikeParkingSpot < ActiveRecord::Base
  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed? 

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      BikeParkingSpot.create! row.to_hash
    end
  end
  
  def no_address?
    true if self.address == "No Exact Address"
  end

end