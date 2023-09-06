Rails.application.routes.draw do
  get 'search' => 'searches#search'
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
    get 'search' => "users#search"
  end
  resources :messages, only: [:show, :create]
  resources :groups, only: [:edit, :show, :create, :update, :index, :new] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
