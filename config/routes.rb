# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show create new] do
    resources :doses, only: %i[new create index]
  end
  resources :doses, only: %i[destroy]
end
