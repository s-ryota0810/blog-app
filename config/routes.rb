# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles
  
  namespace :api, defaults: { format: :json }do
    scope '/articles/:article_id' do
      resources :comments, only: [:create, :index]
      resource :like, only: [:create, :destroy, :show] #likeは一つだから    
    end
  end
  
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  
  #index不要のため（プロフィールは１つだから）
  
  scope module: :apps do
    resource :profile, only: [:show, :edit, :update]
    resources :favorites, only: [:index]
    resource :timeline, only: [:show]
  end
end
