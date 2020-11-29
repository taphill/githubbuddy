# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'auth/github/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect: root_path
end
