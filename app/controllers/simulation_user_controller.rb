class SimulationUserController < ApplicationController

  before_action :authenticate_user, :validate_user_privileges, :browser_version

  def index
    @simulations = current_user.simulations
  end

  def show
  end

  def new
    @appointments = Appointment.all
  end

  def update_hours
    @hours = Hour.where.not(id: Appointment.where(fecha: params[:fecha]).select(:hour_id))
    render :json => @hours
  end

  def create
    @simulation = Simulation.create(quiz: Quiz.find(params[:id]))
    @appointment = Appointment.new(appointment_params)
    @appointment.hour = Hour.find(params[:appointment][:hora])
    @appointment.simulation = @simulation
    if @appointment.save
      flash[:notice] = "La cita ha sido generada exitosamente."
    else
      flash[:error] = @appointment.errors.full_messages.to_sentence
    end
    redirect_to simulation_user_path
  end

  def destroy
  end

  private
  def appointment_params
    params.require(:appointment).permit(:fecha)
  end

end
