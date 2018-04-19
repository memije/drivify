class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user, :browser_version

  protected

  browser = Struct.new(:browser, :version)

  SupportedBrowsers = [
      browser.new('Safari', '6.0.2'),
      browser.new('Firefox', '19.0.2'),
      browser.new('Edge', '16.16299'),
      browser.new('Chrome', '25.0.1364.160')
  ]

  def browser_version
    user_agent = UserAgent.parse(request.user_agent)
    unless SupportedBrowsers.detect { |browser| user_agent >= browser }
      redirect_to error_ie_path
    end
  end

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

  def is_eval?(user)
    user.role.id == 2
  end

  def is_user?(user)
    user.role.id == 3
  end

  def validate_admin_privileges
    if !is_admin?(current_user)
      redirect_to root_path
    end
  end

  def validate_eval_privileges
    if !is_eval?(current_user)
      redirect_to root_path
    end
  end

  def validate_user_privileges
    if !is_user?(current_user)
      redirect_to root_path
    end
  end

end
