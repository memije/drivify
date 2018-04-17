class QuizEvalController < ApplicationController

  before_action :authenticate_user, :validate_eval_privileges, :browser_version

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @user_answers = UserAnswer.where(quiz: @quiz)
    if !(@quiz.evaluator == current_user)
      redirect_to quiz_eval_path
    end
  end

  def validar_eval
    @quiz = Quiz.find(params[:id])
    @quiz.evaluator = current_user
    if @quiz.save
      flash[:notice] = "Evaluador asignado."
    else
      flash[:error] = @quiz.errors.full_messages.to_sentence
    end
    redirect_to quiz_eval_path
  end

end
