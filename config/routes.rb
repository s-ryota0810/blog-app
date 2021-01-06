# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]
    resource :like, only: [:create, :destroy] #likeは一つだから
  end
  
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  
  #index不要のため（プロフィールは１つだから）
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
