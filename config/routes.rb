Rails.application.routes.draw do

  root 'home#index'

  get '/auth/facebook', as: :facebook
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/search' => 'listings#search'

  post '/checkout' => 'transactions#create'

  resources :listings do
    resources :reservations do
    	resources :transactions, only: [:new, :create]
    end
  end

  resources :tags, only: :show
  resources :users

end
