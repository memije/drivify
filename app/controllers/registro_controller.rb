class RegistroController < ApplicationController
  def new
    @user = User.new
    render layout: 'empty'
  end

  def create
    @user = User.new(user_params)
    @user.role = Role.find(3)
    if @user.save
      cookies.signed[:user_id] = @user.id
      flash[:notice] = "Gracias #{@user.nombre}, has sido registrado exitosamente."
      redirect_to registro_url
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new, layout: 'empty'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nombre,:ap_paterno,:ap_materno,:fecha_nacimiento,:curp,:email,:password,:password_confirmation)
  end
end
