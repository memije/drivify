class SimulationEndpointController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
        respond_to do |format|            
            format.pdf { send_simulation_pdf }
        end
    end

    def index
        @user = User.find_by("LOWER(email) = ?",params[:email].downcase)
        if @user.present? && @user.authenticate(params[:password])            
            @appointments = @user.appointments
            render :json => @appointments, :include => :hour            
            return
        end
        render plain: "La combinación de email y contraseña es incorrecta", status: 400
    end
    
    def create                      
        @user = User.find_by("LOWER(email) = ?",params[:email].downcase)
        # byebug
        if @user.present? && @user.authenticate(params[:password])
            @simulation = Simulation.new
            @simulation.obstaculosDerribados = params[:obstacles]
            @simulation.velocidadExcedida = params[:velocity]
            @simulation.fechaAplicacion = DateTime.now
            # @status = "true"
          else
            # @status = "false"
          end        
    end

    private
 
    def simulation_pdf
        simulation = Simulation.find(params[:simulation_id])
        ReportPdf.new(simulation)
    end
    
    def send_simulation_pdf
        send_file simulation_pdf.to_pdf,
        filename: simulation_pdf.filename,
        type: "application/pdf",
        disposition: "inline"
    end
end