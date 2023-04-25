Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "/about", to: "homes#about"
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit]
    resources :cart_items, only: [:index]
    resources :orders, only: [:index, :show]
  end

  namespace :admin do
    resources :items, only: [:new, :index, :show, :edit]
    resources :customers, only: [:index, :show, :edit]
    resources :orders, only: [:show]
  end

  scope module: :admin do
    get "/admin", to: "homes#top"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
