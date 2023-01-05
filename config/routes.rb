Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/api/v1/disease_data', to: '/api/v1/disease_data#index'
  namespace :api do
    namespace :v1 do
      resources :disease_cases
    end
  end
end
