class BikeParkingSpot < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  reverse_geocoded_by :latitude, :longitude do |current_user,result|
   current_user.address = result.address
  end
  after_validation :reverse_geocode  # auto-fetch address

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      BikeParkingSpot.create! row.to_hash
    end
  end

  def no_address?
    true if self.address == "No Exact Address"
  end

end