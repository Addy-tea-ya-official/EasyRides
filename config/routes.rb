Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get '/services', to: 'services#index'
  get '/services/new', to: 'services#new'
  post '/services', to: 'services#create'
  get '/services/:id', to: 'services#show' 
  get '/requests', to: 'drivers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
