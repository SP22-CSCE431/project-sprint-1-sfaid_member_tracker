# frozen_string_literal: true

Rails.application.routes.draw do
  resources :announcements
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'auth/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'auth/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    get 'auth/sign_up', to: 'users#new', as: :new_user
  end

  resources :events
  resources :attendances
  resources :roles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
