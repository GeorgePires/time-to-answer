# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home/welcome#index'

  devise_for :users
  devise_for :admins

  namespace :home do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#verify_answer'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
end
