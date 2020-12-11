# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/:nickname', to: 'users#index', as: 'user_root'

  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: 'auth#failure' 
end
