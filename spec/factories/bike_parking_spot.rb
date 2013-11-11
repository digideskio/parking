FactoryGirl.define do
  factory :bike_parking_spot do
    location "City Beer Store"
    address "1168 Folsom St #101, San Francisco, CA"
    placement "Sidewalk Rack"
    racks 1
    spaces 2
    coordinates "1168 Folsom St #101,(37.7758546,-122.4096451"
    latitude 37.7758546
    longitude -122.4096451
  end
end