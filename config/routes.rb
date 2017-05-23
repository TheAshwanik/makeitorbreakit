Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  root to: "home#index"

  resources :badhabits, except: [:index, :show]
  resources :goodhabits, except: [:index, :show]
  resources :users, only: [:index, :show]

  post "/users/:user_id/goodhabit/:id" => "users#checkin"
  post "/users/:user_id/badhabit/:id" => "users#badcheckin"
end
