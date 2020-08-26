Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  #get 'users/show'
  #root 'home#top'
  root to: "home#top"
  devise_for :users

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books
end
