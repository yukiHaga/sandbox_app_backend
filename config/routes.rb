Rails.application.routes.draw do
  resources :teams do
    scope module: :teams do
      resources :users, only: %i(index)
      namespace :users do
        patch "/bulk", to: "bulks#update"
      end
    end
  end
end
