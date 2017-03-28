Rails.application.routes.draw do
  get 'users/new'

  root 'welcome#index'

  get  '/regisztracio',  to: 'users#new'
  post '/regisztracio',  to: 'users#create'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
