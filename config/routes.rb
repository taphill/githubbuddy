Rails.application.routes.draw do
  root 'home#index'

  resources :welcome, only: [:index]
  resources :sync, only: [:index]

  get '/:nickname', to: 'users#index', as: 'user_root'

  resources :tags, only: [:create, :destroy]
  get '/tags/:repo_id/new', to: 'tags#new', as: 'new_tags'
  get '/tags/:repo_id/edit', to: 'tags#edit', as: 'edit_tags'

  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auth#failure' 
end
