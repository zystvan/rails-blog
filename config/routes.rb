Rails.application.routes.draw do
  root 'welcome#index'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'
  resources :articles do
    resources :comments
  end
  resources :users
  post 'login' => 'sessions#create'
end