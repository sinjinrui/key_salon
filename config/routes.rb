Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'users#index'
  resources :users, only: [:new, :show] do
    collection do
      get :likes
    end
  end
  resources :events do
    resources :likes, only: [:create, :destroy]
    collection do 
      get "search"
    end
  end
end
