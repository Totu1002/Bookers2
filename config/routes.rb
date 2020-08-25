Rails.application.routes.draw do
  #get 'users/show'
  devise_for :users
  root 'books#top'

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books
end
