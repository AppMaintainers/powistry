Powistry::Application.routes.draw do
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
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
  
  root to: 'pages#home'
end
