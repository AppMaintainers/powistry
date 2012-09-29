Powistry::Application.routes.draw do
  get "queries/index"
  get "queries/search"
  
  resources :estimations
  resources :complexities
  resources :users do
    resources :bookmarks
  end
  resources :projects do
    resources :tasks 
  end
  
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  root to: 'pages#home'
end
