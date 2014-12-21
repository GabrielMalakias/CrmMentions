Rails.application.routes.draw do
  
  resources :tweets do 
    match 'parse', on: :collection,  via: [:get, :post]
  end
  
  resources :users

  root 'tweets#index'
  
end
