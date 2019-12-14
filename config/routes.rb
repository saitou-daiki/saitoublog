Rails.application.routes.draw do
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :users
  resources :tweets,only: [:index,:new,:edit,:update,:create,:destroy] do
    namespace :api do
      resources :comments, only: [:index], defaults: { format: 'json' }
    end

    resources :comments, only: [:index, :create]
    collection do
      get 'search'
    end


  end
end
