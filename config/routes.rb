Rails.application.routes.draw do
  resources :teams do
    scope module: :teams do
      resources :users, only: %i(index)
      # cors自作用に作ったルート
      # match '/users', to: 'users#option', via: :options
      namespace :users do
        patch "/bulk", to: "bulks#update"
      end
    end
  end
end
