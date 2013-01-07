Maker::Application.routes.draw do
  resources :projects

  resources :users

  root :to => 'Clearance::Sessions#new'

end
