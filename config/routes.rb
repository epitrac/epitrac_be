Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :disease_cases
      resources :articles 
      resources :favorite_articles, only: [:index, :create]
      resources :disease_info
    end
  end
end
