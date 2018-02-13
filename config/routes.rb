Rails.application.routes.draw do

  get 'registro' => 'registro#new', as: :registro
  post 'registro' => 'registro#create', as: :registro_create

  root 'registro#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
