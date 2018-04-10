Rails.application.routes.draw do

  get 'quiz_user/index'

  get 'quiz_eval/index'

  get 'quiz_controller_eval/index'

  get 'eval_quiz_controller/index'

  get 'quiz_controller/index'

  get 'quiz_type_admin/index'

  get 'quiz_type_admin/new'

  get 'quiz_type_admin/create'

  get 'quiz_type_admin/edit'

  get 'quiz_type_admin/update'

  get 'quiz_type_admin/destroy'

  get 'evaluation/index'

  get 'evaluation/new'

  get 'evaluation/create'

  get 'evaluation/destroy'

  get 'registro' => 'registro#new', as: :registro
  post 'registro' => 'registro#create', as: :registro_create

  get 'login' => 'session#new', as: :login
  post 'login' => 'session#create', as: :login_create
  delete 'session' => 'session#destroy', as: :session_destroy

  get 'home' => 'home#index', as: :home

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
      post '/:id' => 'quiz_eval#validar_eval', as: :validate_quiz_eval
    end

    # modulo de evaluaciones practicas
    scope "/evaluaciones_practicas", evaluaciones_practicas_scope: true do
    end

  end

  # modulos para usuarios
  scope "/usuario" do

    # modulo para evaluaciones teoricas
    scope "/evaluaciones_teoricas", evaluaciones_teoricas_scope: true do
      get '/' => 'quiz_user#index', as: :quiz_user
      get '/:id' => 'quiz_user#show', as: :quiz_user_show
      delete '/' => 'quiz_user#destroy', as: :quiz_user_destroy
      post '/' => 'quiz_user#create', as: :quiz_user_create
    end
  end  

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
