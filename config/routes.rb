Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v4 do
      resources :bookings
    end
    namespace :v3 do
      resources :rooms
    end
    namespace :v2 do
      resources :hotels
    end
    namespace :v1 do
      resources :users
      post '/authentication/login', 'authentication#login'      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
