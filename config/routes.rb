Maker::Application.routes.draw do

  resource  :session,
    :controller => 'sessions',
    :only => [:new, :create, :destroy]

  resources :users, only: [:index, :show]
  resources :goals, only: [:index, :new, :create, :destroy]
  resources :projects do
    resources :steps
  end

  match '/sign_out' => 'sessions#destroy', :via => :delete

  root :to => 'high_voltage/pages#show', :id => 'home'

end
