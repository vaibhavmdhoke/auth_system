Rails.application.routes.draw do
  resources :user_sessions
  resources :users, only: [:show, :new, :create]

  root 'sign_in#new'
  post 'sign_in' => 'sign_in#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
