require 'spec_helper'

describe 'Visitor Should' do

  describe "see parking spots 0.3 miles from them" do 

    before do
      #@current_user = user with location x (address that is close to the bike_parking_spot below)
      @bike_parking_spot = FactoryGirl.create(:bike_parking_spot)
    end
    
    # visit "/bike_parking_spots"
    # within the table do 
    # click on details or maps ... which means there is a spot nearby
  end
end