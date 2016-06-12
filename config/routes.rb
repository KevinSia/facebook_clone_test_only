Rails.application.routes.draw do
  root 'welcome#index'
  get 'sign_out' => 'sessions#destroy', as: 'signout'
  resource :session, only: [:new, :create]
  resources :statuses
  resources :users, except: [:index]
  resources :likes, only: [:create, :destroy]
end
