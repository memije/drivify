class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }

  belongs_to :role
  has_many :requested_quizzes, :class_name => 'Quiz', :foreign_key => 'user_id'
  has_many :evaluated_quizzes, :class_name => 'Quiz', :foreign_key => 'evaluator_id'
  has_many :requested_simulations, :class_name => 'Simulation', :foreign_key => 'user_id'
  has_many :evaluated_simulations, :class_name => 'Simulation', :foreign_key => 'evaluator_id'
end
