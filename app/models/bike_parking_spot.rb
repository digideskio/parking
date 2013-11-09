class BikeParkingSpot < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed? 

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      self.create! row.to_hash
    end
  end
  
  def no_address?
    true if self.address == "No Exact Address"
  end

  def self.closest_to_user
    near(CURRENT_USER_ADDRESS, 0.3)
  end

  def self.has_something_near?
    true unless closest_to_user.empty?
  end

end