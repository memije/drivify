class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user

  protected

  def authenticate_user
    if current_user.blank?
      cookies.delete(:user_id)
      redirect_to(login_path)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
end
