Rails.application.routes.draw do

  get 'transactions/new'

  root 'listings#index'
  get '/auth/facebook', as: :facebook
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/search' => 'listings#search'

  resources :listings


  resources :transactions, only: [:new, :create]
  

end
