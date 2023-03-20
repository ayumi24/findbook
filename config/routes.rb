Rails.application.routes.draw do

  namespace :public do
    get 'post_comments/new'
    get 'post_comments/create'
    get 'post_comments/show'
    get 'post_comments/destroy'
  end
  root to: "public/homes#top"

  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :user, path: :public, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :users, only: [:show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
  end

  namespace :public do
    get 'homes/about'
    get 'books/search'
    resources :books, only: [:show, :create]
    #post 'books/show_or_create'
    #post 'books/:isbn/show_or_create/' => "books/show_or_create"
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:new, :show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
