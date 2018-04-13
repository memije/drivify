class QuestionAdminController < ApplicationController

  before_action :authenticate_user, :validate_admin_privileges, :browser_version

  def index
    @questions = Question.all
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    @question.quiz_type = QuizType.find(params[:question][:quiz_type])
    if @question.save
      flash[:notice] = "La pregunta ha sido registrada exitosamente."
    else
      flash[:error] = @question.errors.full_messages.to_sentence
    end
    redirect_to question_admin_path
  end

  def edit
    @question = Question.find(params[:id])
    render :new
  end

  def update
    @question = Question.find(params[:id])
    @question.quiz_type = QuizType.find(params[:question][:quiz_type])
    if @question.update(question_params)
      flash[:notice] = "La pregunta ha sido actualizada exitosamente."
    else
      flash[:error] = @question.errors.full_messages.to_sentence
    end
    redirect_to question_admin_path
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "La pregunta ha sido eliminada exitosamente."
    else
      flash[:error] = @question.errors.full_messages.to_sentence
    end
    redirect_to question_admin_path
  end

  private
  def question_params
    params.require(:question).permit(:pregunta)
  end
end
