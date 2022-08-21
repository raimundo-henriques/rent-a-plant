Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  get "my_plants", to: "plants#my_plants"
end
