class CreateBikeParkingSpots < ActiveRecord::Migration
  def change
    create_table :bike_parking_spots do |t|
      t.string :location
      t.string :address
      t.string :placement
      t.integer :racks
      t.integer :spaces
      t.string :coordinates
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
