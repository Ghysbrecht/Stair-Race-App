Rails.application.routes.draw do
  resources :leaderboards
  get    '/',                   to: 'leaderboards#show'
  get    '/participants',       to: 'participants#show'
  get    '/participants/new',   to: 'participants#new'
  get    '/signup',             to: 'participants#new'
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'


  resources :admins
  resources :participants
  resources :leaderboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
