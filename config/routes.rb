Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'term', to: 'static_pages#term'
  get 'policy', to: 'static_pages#policy'
  get 'contact', to: 'static_pages#contact'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :plans do
    resources :countries
  end
end
