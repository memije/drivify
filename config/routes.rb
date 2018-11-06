Rails.application.routes.draw do

  # get 'simulation_speed_pollings/list'  

  get 'registro' => 'registro#new', as: :registro
  post 'registro' => 'registro#create', as: :registro_create

  get 'login' => 'session#new', as: :login
  post 'login' => 'session#create', as: :login_create
  delete 'session' => 'session#destroy', as: :session_destroy

  get 'home' => 'home#index', as: :home

  get 'about' => 'about#index', as: :about

  # modulos para administradores
  scope "/admin" do

    # modulo de administracion de usuarios
    scope "/usuarios", admin_users_scope: true do
      get '/' => 'user_admin#index', as: :user_admin
      get '/nuevo' => 'user_admin#new', as: :new_user
      get '/:id' => 'user_admin#edit', as: :edit_user
      post '/nuevo' => 'user_admin#create', as: :new_user_create
      post '/:id' => 'user_admin#update', as: :edit_user_update
      delete '/:id' => 'user_admin#destroy', as: :destroy_user
    end

    # modulo de administracion de tipos de examenes
    scope "/tipos_examen", admin_quizzes_type_scope: true do
      get '/' => 'quiz_type_admin#index', as: :quiz_type_admin
      get '/nuevo' => 'quiz_type_admin#new', as: :new_quiz_type
      get '/:id' => 'quiz_type_admin#edit', as: :edit_quiz_type
      post '/nuevo' => 'quiz_type_admin#create', as: :new_quiz_type_create
      post '/:id' => 'quiz_type_admin#update', as: :edit_quiz_type_update
      delete '/:id' => 'quiz_type_admin#destroy', as: :destroy_quiz_type
    end

    # modulo de administracion de preguntas
    scope "/preguntas", admin_questions_scope: true do
      get '/' => 'question_admin#index', as: :question_admin
      get '/nuevo' => 'question_admin#new', as: :new_question
      get '/:id' => 'question_admin#edit', as: :edit_question
      post '/nuevo' => 'question_admin#create', as: :new_question_create
      post '/:id' => 'question_admin#update', as: :edit_question_update
      delete '/:id' => 'question_admin#destroy', as: :destroy_question
    end

    # modulo de administracion de respuestas
    scope "/respuestas", admin_answers_scope: true do
      get '/' => 'answer_admin#index', as: :answer_admin
      get '/nuevo' => 'answer_admin#new', as: :new_answer
      get '/:id' => 'answer_admin#edit', as: :edit_answer
      post '/nuevo' => 'answer_admin#create', as: :new_answer_create
      post '/:id' => 'answer_admin#update', as: :edit_answer_update
      delete '/:id' => 'answer_admin#destroy', as: :destroy_answer
    end
  end

  # modulos para evaluadores
  scope "/eval" do

    # modulo de evaluaciones teoricas
    scope "/evaluaciones_teoricas", evaluaciones_teoricas_scope: true do
      get '/' => 'quiz_eval#index', as: :quiz_eval
      get '/:id' => 'quiz_eval#show', as: :quiz_eval_show
      post '/:id' => 'quiz_eval#validar_eval', as: :validate_quiz_eval
    end

    # modulo de evaluaciones practicas
    scope "/evaluaciones_practicas", evaluaciones_practicas_scope: true do
      get '/' => 'simulation_eval#index', as: :simulation_eval
    end

  end

  # modulos para usuarios
  scope "/usuario" do

    # modulo para evaluaciones teoricas
    scope "/evaluaciones_teoricas", evaluaciones_teoricas_scope: true do
      get '/' => 'quiz_user#index', as: :quiz_user
      get '/:id' => 'quiz_user#consulta', as: :quiz_user_consulta
      get '/evaluacion/:id' => 'quiz_user#show', as: :quiz_user_show
      post '/' => 'quiz_user#create', as: :quiz_user_create
      post '/evaluacion/:id' => 'quiz_user#save', as: :quiz_user_save
      # delete '/' => 'quiz_user#destroy', as: :quiz_user_destroy
    end

    # modulo para simulaciones
    scope "/evaluaciones_practicas", simulaciones_scope: true do
      get '/' => 'simulation_user#index', as: :simulation_user
      get '/nueva/:id' => 'simulation_user#new', as: :'simulation_user_new'
      post '/nueva/:id' => 'simulation_user#create', as: :simulation_user_create
      post '/update_hours' => 'simulation_user#update_hours', as: :simulation_user_update_hours
    end

  end

  scope "simulations" do
    post "/create" => 'simulations#create', as: :simulation_endpoint_create
    post "/index" => 'simulations#index', as: :simulation_endpoint_index
    get "/show/:id" => 'simulations#show', as: :simulation_endpoint_show
  end

  post 'simulation_speed_pollings/create'

  get '/error_ie' => 'error#ie', as: :error_ie

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
