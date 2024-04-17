Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bills
      resources :enrollments
      resources :students
      resources :institutions
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "posts#index"
    end
  end
  root "api/v1/institutions#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
