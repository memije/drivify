class SimulationEvalController < ApplicationController

  before_action :authenticate_user, :validate_eval_privileges, :browser_version

  def index
    @simulations = Simulation.where(quiz: Quiz.where(evaluator: current_user))
    # render json: @simulations
  end
end
