Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/api/v1/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :enrollments do
        resources :bills, only: [:enrollment_bills]
      end
      resources :bills
      resources :students
      resources :institutions
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "posts#index"
    end
  end
  get 'api/v1/enrollments/:id/bills', to: 'api/v1/bills#enrollment_bills'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
