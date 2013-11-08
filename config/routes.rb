BikeParkingSanfran::Application.routes.draw do
  get "home/home"
  
  resources :bike_parking_spots

  #for now
  root 'home#home'

end
