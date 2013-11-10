class HomeController < ApplicationController
  
  def home

    if BikeParkingSpot.closest_to_user(current_user_address).empty?
      flash.now[:notice] = "Are you in San Fran? I don't think so..."
    end
    
    @hash = Gmaps4rails.build_markers(BikeParkingSpot.closest_to_user(current_user_address)) do |bike_parking_spot, marker|
      marker.lat bike_parking_spot.latitude
      marker.lng bike_parking_spot.longitude
      marker.infowindow bike_parking_spot.location
      marker.infowindow render_to_string(:partial => "bike_parking_spots/info_window.html.haml", :locals => { object: bike_parking_spot })
    end
  end

end
