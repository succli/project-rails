Rails.application.routes.draw do

  root 'welcome#index'

  get  '/regisztracio',  to: 'users#new'
  post '/regisztracio',  to: 'users#create'
  resources :users

  get    '/bejelentkezes',   to: 'session#new'
  post   '/bejelentkezes',   to: 'session#create'
  delete '/kijelentkezes',   to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
