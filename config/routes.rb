require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index"
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :home
  end

  resources :tasks, only: [:create, :update, :destroy]

  resource :session, only: [:create, :destroy]
  resources :users, only: [:create]
end
