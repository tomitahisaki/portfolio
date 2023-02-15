Rails.application.routes.draw do
  root to: 'static_pages#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :plans do
    resources :countries, only: %i[new create]
  end  
end
