Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books, except: [:new]
  get '/' => 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
