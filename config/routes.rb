# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :squeeze do
    namespace :v1 do
      resource :authentication, only: %i[create]
      resources :users, only: %i[create]
      resource :user, only: %i[update]
      resources :accounts
      resources :budgets do
        resources :categories
        resources :incomes
      end
    end
  end
end
