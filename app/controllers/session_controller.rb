class SessionController < ApplicationController

  # before_action :authenticate_user, only: [:new,:create]

  def new
    render layout: 'empty'
  end

  def create
    @user = User.find_by("LOWER(email) = ?",login_params[:email].downcase)
    if @user.present? && @user.authenticate(login_params[:password])
      cookies.signed[:user_id] = @user.id
      flash[:notice] = "Bienvenido de vuelta <b>#{@user.nombre}</b>."
      redirect_to home_path
    else
      flash.now[:error] = "La combinación de email y contraseña es incorrecta."
      render :new, layout: 'empty'
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_url
  end

  private
  def login_params
    params.require(:login).permit(:email,:password)
  end
end
