Rails.application.routes.draw do

  root to: "public/homes#top"

  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :user, skip:[:passwords], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  namespace :admin do
    get 'homes/top'
  end

  namespace :public do
    get 'homes/about'
    get 'books/search'
    resources :posts, only: [:new, :show, :edit, :update, :destroy]
    resources :users, only: [:new, :show, :edit, :uodate, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
