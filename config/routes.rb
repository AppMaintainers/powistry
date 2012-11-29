Powistry::Application.routes.draw do
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  resources :estimations
  resources :complexities
  resources :users
  resources :projects do
    resources :tasks 
  end
  
  root to: 'pages#home'
end
