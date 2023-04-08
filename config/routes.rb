Rails.application.routes.draw do
  get 'budgets/new'
  get 'budgets/create'
  get 'budgets/edit'
  get 'budgets/update'
  get 'budgets/destroy'
  get 'visas/show'
  root to: 'static_pages#top'

  get 'term', to: 'static_pages#term'
  get 'policy', to: 'static_pages#policy'
  get 'contact', to: 'static_pages#contact'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'guest_login', to: 'user_sessions#guest_login'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create destroy]
  resources :plans do
    resources :countries
    resources :budgets, only: %i[new create show edit update destroy]
  end
  resources :visas, only: %i[show]
  resource :profile, only: %i[show edit update]
end
