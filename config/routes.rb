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
    get "/about", to: "homes#about", as: "about"
  end

  scope module: :admin do
    get "/admin", to: "homes#top", as: "admin"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
