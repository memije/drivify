class AnswerAdminController < ApplicationController

  before_action :authenticate_user, :validate_privileges

  def index
    @answers = Answer.all
  end

  def new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:answer][:question])
    if @answer.save
      flash[:notice] = "La respuesta ha sido registrada exitosamente."
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
    end
    redirect_to answer_admin_path
  end

  def edit
    @answer = Answer.find(params[:id])
    render :new
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.question = Question.find(params[:answer][:question])
    if @answer.update(answer_params)
      flash[:notice] = "La respuesta ha sido actualizada exitosamente."
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
    end
    redirect_to answer_admin_path
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.destroy
      flash[:notice] = "La respuesta ha sido eliminada exitosamente."
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
    end
    redirect_to answer_admin_path
  end

  private
  def answer_params
    params.require(:answer).permit(:inciso, :respuesta, :correcta)
  end
end
