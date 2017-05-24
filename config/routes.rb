Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  root to: "home#index"

  resources :badhabits, except: [:index, :show]
  resources :goodhabits, except: [:index, :show]
  resources :users, only: [:index, :show]

  post "/users/:user_id/goodhabit/:id" => "users#checkin"
  post "/users/:user_id/badhabit/:id" => "users#badcheckin"

  get "/users/:user_id/goodhabit/:id/calendar" => "users#calendar"

end
