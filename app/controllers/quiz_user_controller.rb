class QuizUserController < ApplicationController

  before_action :authenticate_user, :validate_user_privileges, :browser_version

  def index
    @quizzes = current_user.requested_quizzes
    @active_quizzes = Quiz.active_quizzes(@quizzes)
  end

  def create
    @quiz = Quiz.new
    @quiz.user = current_user
    @quiz.quiz_type = QuizType.order("RANDOM()").first
    if @quiz.save
      flash[:notice] = "La solicitud ha sido registrada exitosamente."
    else
      flash[:error] = @quiz.errors.full_messages.to_sentence
    end
    redirect_to quiz_user_path
  end

  def show
    @quiz = Quiz.find(params[:id])
    if @quiz.user != current_user || !@quiz.puntaje.blank?
      redirect_to quiz_user_path
    end
  end

  def consulta
    @quiz = Quiz.find(params[:id])    
    @user_answers = UserAnswer.where(quiz: @quiz)
  end

  # def destroy
  #   @quiz = Quiz.find(params[:id])
  #   if @quiz.destroy
  #   end
  # end

  def save
    user_answers = []
    count = 0
    params[:answer].each do |pregunta, respuesta|
      user_answer = UserAnswer.new
      user_answer.quiz = Quiz.find(params[:id])
      user_answer.question = Question.find(pregunta)
      user_answer.answer = Answer.find(respuesta)
      if user_answer.save
        user_answers.push(user_answer)
        if user_answer.answer.correcta
          count += 1
        end
      else
        flash[:error] = user_answer.errors.full_messages.to_sentence
        redirect_to quiz_user_path
      end
      quiz = Quiz.find(params[:id])
      quiz.fecha_aplicacion = DateTime.now
      quiz.puntaje = (count * 10) / quiz.quiz_type.questions.count
      quiz.save
    end
    flash[:notice] = "Las respuestas han sido registradas exitosamente."
    redirect_to quiz_user_path
  end
end
