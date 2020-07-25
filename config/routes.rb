Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "/home/about" => "homes#about", as: :about
  get "/users/:id/following" => "users#following", as: :following
  get "/users/:id/follower" => "users#follower", as: :follower
  resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
  # delete "/books/:book_id/post_comments/:id" => "post_comments#destroy", as: :book_post_comment
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]

  end

  resources :relationships, only: [:create, :destroy]

end
