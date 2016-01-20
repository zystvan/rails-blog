Rails.application.routes.draw do
  root 'welcome#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :articles do
    resources :comments
  end
  resources :users
end