class QuizUserController < ApplicationController

  before_action :authenticate_user, :validate_user_privileges

  def index
    @quizzes = Quiz.where(user: current_user)    
  end
end
