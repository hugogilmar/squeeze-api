# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :squeeze do
    namespace :v1 do
      jsonapi_resources :users, only: %i[show create]
    end
  end
end
