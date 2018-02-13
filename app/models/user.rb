class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }

  validates_format_of :curp, :with => /\A([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)\Z/

  belongs_to :role
  has_many :requested_quizzes, :class_name => 'Quiz', :foreign_key => 'user_id'
  has_many :evaluated_quizzes, :class_name => 'Quiz', :foreign_key => 'evaluator_id'
  has_many :requested_simulations, :class_name => 'Simulation', :foreign_key => 'user_id'
  has_many :evaluated_simulations, :class_name => 'Simulation', :foreign_key => 'evaluator_id'
end
