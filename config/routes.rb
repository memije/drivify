Rails.application.routes.draw do

  get 'registro' => 'registro#new', as: :registro
  post 'registro' => 'registro#create', as: :registro_create

  get 'login' => 'session#new', as: :login
  post 'login' => 'session#create', as: :login_create
  delete 'session' => 'session#destroy', as: :session_destroy

  get 'home' => 'home#index', as: :home

  get 'usuarios' => 'user_admin#index', as: :user_admin
  get 'usuarios/nuevo' => 'user_admin#new', as: :new_user
  get 'usuarios/:id' => 'user_admin#edit', as: :edit_user
  post 'usuarios/nuevo' => 'user_admin#create', as: :new_user_create
  post 'usuarios/:id' => 'user_admin#update', as: :edit_user_update
  delete 'usuarios/:id' => 'user_admin#destroy', as: :destroy_user

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
