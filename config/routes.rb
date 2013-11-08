BikeParkingSanfran::Application.routes.draw do
  get "home/home"
  get "home/import"
  
  resources :bike_parking_spots do 
    collection { post :import }
  end

  #for now
  root 'home#home'

end
