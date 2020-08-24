Rails.application.routes.draw do
  #get 'users/show'
  #root to: 'books#top'
  devise_for :users
  #ログイン後リダイレクトパス
  root 'users#show'

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books
end
