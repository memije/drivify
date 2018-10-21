class SimulationSpeedPollingsController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def list
  end

  def create
    if is_valid_user?
      @simulation = Simulation.find(params[:simulation])
      @speedPolling = SimulationSpeedPolling.new
      @speedPolling.simulation_id = @simulation.id
      @speedPolling.speed = params[:speed]
      @speedPolling.second = params[:second]
      @speedPolling.save!
      render json: @speedPolling
      return
    end
    render plain: "La combinación de email y contraseña es incorrecta", status: 400
  end

  private
  
  def is_valid_user?
    @user = User.find_by("LOWER(email) = ?",params[:email].downcase)
    @user.present? && @user.authenticate(params[:password])
  end  
end
