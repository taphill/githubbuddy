# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/:nickname', to: 'users#index', as: 'user_root'

  get '/tags/:repo', to: 'user_repos#edit', as: 'user_repo_edit'
  # patch '/:repo', to: 'user_repos#update', as: 'user_repo'

  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auth#failure' 
end
