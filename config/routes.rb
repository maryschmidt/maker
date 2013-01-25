Maker::Application.routes.draw do

  resource  :session,
    :controller => 'sessions',
    :only => [:new, :create, :destroy]

  resources :users, only: [:index, :show, :create]
  resources :goals, only: [:index, :new, :create, :destroy]
  resources :projects do
    resources :comments, only: [:create]
    resources :steps
  end
  resources :relationships, only: [:create, :destroy]

  match '/sign_out' => 'sessions#destroy', :via => :delete

  root :to => 'high_voltage/pages#show', :id => 'home'

end
