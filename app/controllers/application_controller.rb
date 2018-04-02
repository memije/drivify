class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user

  protected

  def authenticate_user
    if current_user.blank?
      session.delete(:user_id)
      redirect_to(login_path)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def is_admin?(user)
    user.role.id == 1
  end

  def validate_privileges
    if !is_admin?(current_user)
      redirect_to root_path
    end
  end
end
