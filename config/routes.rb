Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions
      post "extract", to: "transactions#extract"
    end
  end
end
