Rails.application.routes.draw do
  get    '/',        to: 'leaderboards#index'
  get    '/signup',  to: 'participants#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/logout',  to: 'sessions#destroy'
  get    '/newgame', to: 'leaderboards#destroy'
  resources :leaderboards
  resources :admins
  resources :participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
end
