Rails.application.routes.draw do
  resources :teams do
    resources :users, only: %i(index), module: :teams
  end
end
