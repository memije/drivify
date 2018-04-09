class QuizTypeAdminController < ApplicationController

  before_action :authenticate_user, :validate_privileges

  def index
    @types = QuizType.all
  end

  def new
  end

  def create
    @quiz_type = QuizType.new(type_params)
    if @quiz_type.save
      flash[:notice] = "El tipo de evaluación teórica ha sido registrado exitosamente."
    else
      flash[:error] = @quiz_type.errors.full_messages.to_sentence
    end
    redirect_to quiz_type_admin_path
  end

  def edit
    @quiz_type = QuizType.find(params[:id])
    render :new
  end

  def update
    @quiz_type = QuizType.find(params[:id])
    if @quiz_type.update(type_params)
      flash[:notice] = "El tipo de evaluación teórica ha sido actualizado exitosamente."
    else
      flash[:error] = @quiz_type.errors.full_messages.to_sentence
    end
    redirect_to quiz_type_admin_path
  end

  def destroy
    @quiz_type = QuizType.find(params[:id])
    if @quiz_type.destroy
      flash[:notice] = "El tipo de evaluación teórica ha sido eliminado exitosamente."
    else
      flash[:error] = @quiz_type.errors.full_messages.to_sentence
    end
    redirect_to quiz_type_admin_path
  end

  private
  def type_params
    params.require(:quiz_type).permit(:nombre)
  end

end
