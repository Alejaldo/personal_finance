Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions
      get "statement", to: "transactions#extract"
    end
  end
end
