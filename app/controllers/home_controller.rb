class HomeController < ApplicationController

  before_action :authenticate_user, :browser_version

  def index
  end
end
