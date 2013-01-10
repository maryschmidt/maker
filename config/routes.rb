Maker::Application.routes.draw do

  resource  :session,
    :controller => 'sessions',
    :only => [:new, :create, :destroy]

  resources :users, only: [:index, :show] do
    resources :projects
  end

  match '/sign_out' => 'sessions#destroy', :via => :delete

  root :to => 'Clearance::Users#new'

end
