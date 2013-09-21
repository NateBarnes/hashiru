Hashiru::Application.routes.draw do
  root 'home#index'

  get  'register' => 'home#register'
  post 'register' => 'home#register'
end
