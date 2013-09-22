Hashiru::Application.routes.draw do
  root 'home#today'

  get 'today' => 'home#today', as: :today
  get 'search' => 'home#search', as: :search

  resources :users
  resources :workouts
  resource :event
end
