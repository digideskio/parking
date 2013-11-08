BikeParkingSanfran::Application.routes.draw do
  
  
  resources :bike_parking_spots

  get "home/home"
  root 'home#home'

end
