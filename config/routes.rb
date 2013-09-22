Hashiru::Application.routes.draw do
  root 'home#today'

  get 'today' => 'home#today', as: :today

  resources :users
end
