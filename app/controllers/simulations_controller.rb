class SimulationsController < ApplicationController

  require 'rqrcode_png'

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: :show
  before_action :validate_evaluation, only: :show
  # encoding: utf-8

  def index
    if is_valid_user?
      # Obtener ultima simulacion sin presentar
      @simulations = @user.simulations.where(fecha_aplicacion: nil).last
      @appointments = @user.appointments
      render :json => @simulations, :include => [:appointment, :get_horas]
      return
    end
    render plain: "La combinación de email y contraseña es incorrecta", status: 400
  end

  def show

    @data = @simulation.simulation_speed_pollings.map{ |m| [m.second, m.speed] }

    @qr = RQRCode::QRCode.new(@digest).to_img.resize(185, 185).to_data_url

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "simulacion",
        javascript_delay: 3000,
        lowquality: false,
        page_size: "Letter",
        template: "simulations/show.html.erb",
        layout: 'layouts/pdf.pdf.erb',
        disposition: "inline",
        encoding: 'utf8',
        dpi: "300",
        margin:  {
          top:               5,                     # default 10 (mm)
          bottom:            5,
          left:              5,
          right:             5 },
        show_as_html: params.key?('debug')
      end
    end
  end

  def create
    if is_valid_user?
      @simulation = Simulation.find(params[:simulation])
      @simulation.fecha_aplicacion = DateTime.now
      @simulation.obstaculos_derribados = params[:cones].to_i
      @simulation.semaforos = params[:traffic_lights].to_i
      @simulation.tiempo_simulacion = params[:duration].to_f
      @simulation.velocidad_promedio = params[:average_speed].to_f
      @simulation.save!
      render json: @simulation
      return
    end
    render plain: "La combinación de email y contraseña es incorrecta", status: 400
  end

  private

  def is_valid_user?
    @user = User.find_by("LOWER(email) = ?",params[:email].downcase)
    @user.present? && @user.authenticate(params[:password])
  end

  def validate_evaluation
    @user = current_user
    @quiz = Quiz.find(params[:id])
    @simulation = @quiz.simulation
    @digest = Digest::SHA2.new(512).base64digest("#{@user.id}#{@quiz.id}#{@simulation.id}")

    if @quiz.fecha_aplicacion.blank? || @simulation.fecha_aplicacion.blank?
      flash[:error] = "Operación no válida"
      redirect_to simulation_user_path
    end
  end

  def convert_duration(duration)
    seconds = duration.tiempo_simulacion % 60
    minutes = (duration.tiempo_simulacion / 60) % 60
    hours = duration.tiempo_simulacion / (60 * 60)
    duracion = format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
