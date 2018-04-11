class QuizUserController < ApplicationController

  before_action :authenticate_user, :validate_user_privileges

  def index
    @quizzes = Quiz.where(user: current_user)
    @active_quizzes = Quiz.where(user: current_user, fecha_aplicacion: nil)
  end

  def create
    @quiz = Quiz.new
    @quiz.user = current_user
    @quiz.quiz_type = QuizType.order("RANDOM()").first
    if @quiz.save
      flash[:notice] = "La solicitud ha sido registrada exitosamente."
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
    end
    redirect_to quiz_user_path
  end

  def show
    @quiz = Quiz.find(params[:id])
    if @quiz.user != current_user || !@quiz.puntaje.blank?
      redirect_to quiz_user_path
    else
    end
  end

  def consulta
    @quiz = Quiz.find(params[:id])    
    @userAnswers = UserAnswer.where(quiz: @quiz);
  end

  # def destroy
  #   @quiz = Quiz.find(params[:id])
  #   if @quiz.destroy
  #   end
  # end

  def save

    userAnswers = Array.new
    count = 0

    params[:answer].each do |pregunta, respuesta|
      userAnswer = UserAnswer.new
      userAnswer.quiz = Quiz.find(params[:id])
      userAnswer.question = Question.find(pregunta)
      userAnswer.answer = Answer.find(respuesta)

      if userAnswer.save
        userAnswers.push(userAnswer)
        if userAnswer.answer.correcta
          count += 1
        end
      else
        flash[:error] = userAnswer.errors.full_messages.to_sentence
        redirect_to quiz_user_path
      end
      quiz = Quiz.find(params[:id])
      quiz.fecha_aplicacion = DateTime.now
      quiz.puntaje = (count*10)/quiz.quiz_type.questions.count
      quiz.save
    end

    flash[:notice] = "Las respuestas han sido registradas exitosamente."
    redirect_to quiz_user_path

  end

end
