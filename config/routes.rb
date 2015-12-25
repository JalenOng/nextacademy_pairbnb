Rails.application.routes.draw do


  root 'listings#index'
  get '/auth/facebook', as: :facebook
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/search' => 'listings#search'

  resources :listings do
    resources :reservations
  end


  resources :transactions, only: [:new, :create]
  

end
