Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: [:index, :show]

  namespace :api, constraints: { format: 'json' } do
    resources :events, only: [:index, :show]
    resources :locations, only: [:index, :show]
  end
end
