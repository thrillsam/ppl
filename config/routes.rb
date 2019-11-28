Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	resources :logo, only: [:create, :show]
  	resources :team, only: [:index]
  	resources :users, only: [:create]
  	resources :match_details, only: [:index, :show]
  	
  	post "login", to: "sessions#create", as: "login"
  	get "logout", to: "sessions#destroy", as: "logout"
  end

end
