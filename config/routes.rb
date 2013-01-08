Maker::Application.routes.draw do
  resources :projects

  resources :users, only: [:index, :show]

  root :to => 'Clearance::Sessions#new'

end
