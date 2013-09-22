Hashiru::Application.routes.draw do
  root 'home#today'

  get 'today' => 'home#today', as: :today
  get 'search' => 'home#search', as: :search
  post 'save_event' => 'home#save_event', as: :save_event

  resources :users
  resources :workouts
  resource :event
end
