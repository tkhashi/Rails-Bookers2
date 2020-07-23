Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "/home/about" => "homes#about", as: :about
  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
end
