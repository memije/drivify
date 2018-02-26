Rails.application.routes.draw do

  get 'registro' => 'registro#new', as: :registro
  post 'registro' => 'registro#create', as: :registro_create

  get 'login' => 'session#new', as: :login
  post 'login' => 'session#create', as: :login_create
  delete 'session' => 'session#destroy', as: :session_destroy

  get 'home' => 'home#index', as: :home

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
