Rails.application.routes.draw do
  devise_for :users

  resources :documents, only: [:new, :create, :show] do
    resources :lines, only: [:show]
  end

  root to: "documents#new"
end
