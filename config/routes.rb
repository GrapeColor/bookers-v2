Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books, except: [:new]
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
