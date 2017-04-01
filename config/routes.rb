Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get  '/regisztracio',  to: 'users#new'
  post '/regisztracio',  to: 'users#create'
  resources :users

  get    '/bejelentkezes',   to: 'session#new'
  post   '/bejelentkezes',   to: 'session#create'
  delete '/kijelentkezes',   to: 'session#destroy'

  resources :account_activations, only: [:edit]
end
