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
    if @quiz.user != current_user      
      redirect_to quiz_user_path            
    else
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.destroy
    end
  end
end
