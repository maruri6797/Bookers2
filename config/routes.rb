Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :index, :edit, :show, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :follows, :followers
    end
  end
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
