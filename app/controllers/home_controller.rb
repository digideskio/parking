class HomeController < ApplicationController
  
  def home
    if Rails.env.test? || Rails.env.development?
      current_user_address = '405 Howard Street San Francisco, CA, 94105'
    else
      current_user_address = request.location.address
      Rails.logger.info(current_user_address)
    end

    bike_parking_spots_nearby = BikeParkingSpot.near(current_user_address, 0.2)
    
    @hash = Gmaps4rails.build_markers(bike_parking_spots_nearby) do |bike_parking_spot, marker|
      marker.lat bike_parking_spot.latitude
      marker.lng bike_parking_spot.longitude
      marker.infowindow bike_parking_spot.location
      marker.infowindow render_to_string(:partial => "bike_parking_spots/info_window.html.erb", :locals => { object: bike_parking_spot })
    end
  end

end
