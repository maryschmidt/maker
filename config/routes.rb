Maker::Application.routes.draw do

  resource  :session,
    controller: :sessions,
    only: [:new, :create, :destroy]

  resources :users, only: [:index, :show, :create]
  resources :goals
  resources :projects do
    resources :comments, only: [:create]
    resources :steps
  end
  resources :relationships, only: [:create, :destroy]

  namespace :dashboard do
    resources :projects, only: [:index]
  end

  delete "sign_out" => "sessions#destroy"

  root to: "home/projects#index"

end
