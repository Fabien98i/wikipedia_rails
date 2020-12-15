Rails.application.routes.draw do
  resources :contents
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/sign_in', to: 'session#index_sign_in'
  post '/sign_in', to: 'session#sign_in'
  delete '/sign_out', to: 'session#sign_out'
  
  #articles$
  # get '/articles', to: 'articles#index'
  # get 'arctiles/new', to: 'articles#new'
  # post '/articles', to: 'articles#create'
  # get 
end
