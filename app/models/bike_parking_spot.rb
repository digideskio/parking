class BikeParkingSpot < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed? 

  # for importing new data
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      self.create! row.to_hash
    end
  end
  
  def no_address?
    true if self.address == "No Exact Address"
  end

  def self.closest_to_user(location)
    near(location, 0.3)
  end

  def self.has_something_near?(location)
    true unless closest_to_user(location).empty?
  end

end