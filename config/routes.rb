Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :disease_cases, only: [:index]
      resources :articles, only: [:index]
      resources :disease_info, only: [:index]
      resources :user_articles, only: [:index, :create, :destroy]
      delete "user/user_articles/:user_id", to: "user_articles#destroy_all"
    end
  end
end
