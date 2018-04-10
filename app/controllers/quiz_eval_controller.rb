class QuizEvalController < ApplicationController

  before_action :authenticate_user, :validate_eval_privileges

  def index
    @quizzes = Quiz.all
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
    # render :json => @quiz
  end

end
