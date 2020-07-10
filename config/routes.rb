Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home/about" => "homes#about", as: :about

  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]

  root 'homes#top'
end
