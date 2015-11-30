Rails.application.routes.draw do

  root 'welcome#index'
  get '/auth/facebook', as: :facebook
  get '/auth/facebook/callback' => 'sessions#facebook'


  resources :listings


end
