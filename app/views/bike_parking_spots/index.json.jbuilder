json.array!(@bike_parking_spots) do |bike_parking_spot|
  json.extract! bike_parking_spot, :location, :address, :placement, :racks, :spaces, :coordinates, :latitude, :longitude
  json.url bike_parking_spot_url(bike_parking_spot, format: :json)
end