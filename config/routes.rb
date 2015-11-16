require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  resources :documents, only: [:new, :create, :show] do
    resources :lines, only: [:show], param: "line_number"
  end

  root to: "documents#new"

  mount Sidekiq::Web => "/jobs"
end
