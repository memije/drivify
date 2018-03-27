class User < ApplicationRecord

  has_secure_password
  validates :email, uniqueness: true
  validates_format_of :curp, :with => /\A([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)\Z/, :message => 'no válida'
  belongs_to :role
  has_many :requested_quizzes, :class_name => 'Quiz', :foreign_key => 'user_id'
  has_many :evaluated_quizzes, :class_name => 'Quiz', :foreign_key => 'evaluator_id'
end
