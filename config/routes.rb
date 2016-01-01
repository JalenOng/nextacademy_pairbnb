Rails.application.routes.draw do



  root 'listings#index'
  get '/auth/facebook', as: :facebook
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/search' => 'listings#search'

  post '/checkout' => 'transactions#create'

  resources :listings do
    resources :reservations do 
    	resources :transactions, only: [:new, :create]
    end

  end


  

end
