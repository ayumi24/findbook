Rails.application.routes.draw do

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
  end

  namespace :public do
    get 'homes/about'
    get 'books/search'
    resources :books, only: [:show]
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:new, :show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
