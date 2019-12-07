Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :tweets do
    resources :comments,only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root to: 'tweets#index'

end
