BikeParkingSanfran::Application.routes.draw do
  
  # namespace :api, defaults: {format: 'json'} do 
  #   namespace :v1 do 
  #     resources :bike_parking_spots
  #   end
  # end
  
  resources :bike_parking_spots do
    collection { post :import }
  end

  get "home/home"
  root 'home#home'

end
