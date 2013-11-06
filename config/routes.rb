BikeParkingSanfran::Application.routes.draw do
  resources :bike_parking_spots do 
    collection { post :import }
  end

  #for now
  root 'bike_parking_spots#index'

end
