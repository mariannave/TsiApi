Rails.application.routes.draw do
  apipie

  root to: "apipie/apipies#index"

  resources :books
  resources :courses do
    resources :books
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
