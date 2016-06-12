Rails.application.routes.draw do

  get 'statuses/index'

  get 'statuses/show'

  get 'statuses/new'

  get 'statuses/create'

  get 'statuses/edit'

  get 'statuses/update'

  get 'statuses/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  root 'welcome#index'

  resource :sessions, only: [:new, :create, :destroy]
  resources :statuses
  resources :users, except: [:index]
  resources :likes, only: [:create, :destroy]
end
