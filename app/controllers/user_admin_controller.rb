class UserAdminController < ApplicationController

  before_action :authenticate_user, :validate_privileges

  def index
    @users = User.all.order(:nombre)
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.role = Role.find(params[:user][:role])
    if @user.save
      flash[:notice] = "<b>#{@user.nombre}</b> ha sido registrado exitosamente."
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    redirect_to user_admin_path
  end

  def update
    @user = User.find(params[:id])
    @user.role = Role.find(params[:user][:role])
    if @user.update(user_params)
      flash[:notice] = "<b>#{@user.nombre}</b> ha sido actualizado exitosamente."
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    redirect_to user_admin_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "<b>#{@user.nombre}</b> ha sido eliminado exitosamente."
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    redirect_to user_admin_path
  end

  private
  def user_params
    params.require(:user).permit(:nombre,:ap_paterno,:ap_materno,:fecha_nacimiento,:curp,:email,:password,:password_confirmation)
  end

end
