Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get     '/regisztracio',                 to: 'users#new'
  post    '/regisztracio',                 to: 'users#create'
  
  scope(path_names: { edit: 'szerkesztes' }) do
    resources :users, path: 'felhasznalok', except: [:new, :create]
  end

  get    '/bejelentkezes',   to: 'session#new'
  post   '/bejelentkezes',   to: 'session#create'
  delete '/kijelentkezes',   to: 'session#destroy'

  scope(path_names: { new: 'uj', edit: 'szerkesztes' }) do
    resources :posts, path: 'blog'
  end
  
end
